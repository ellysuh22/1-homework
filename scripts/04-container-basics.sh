#!/usr/bin/env bash
# =============================================================================
#  Phase 4 — 컨테이너 실행 실습 + Docker 기본 운영 명령
#  미션 4장 요구:
#    - hello-world 실행 성공 기록
#    - ubuntu 컨테이너 실행 후 내부 진입, 간단 명령(ls, echo) 수행
#    - 컨테이너 종료/유지(attach/exec 등)의 차이를 관찰하고 정리
#    - 컨테이너: 실행/중지/목록 확인 / 로그 확인 / 리소스 확인
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/04-container-basics.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

# 이전 실습 잔여물 정리 (로그에는 남기지 않는 준비 작업)
docker rm -f tick-demo ubuntu-lab >/dev/null 2>&1 || true

# ---------------------------------------------------------------------------
# TTY(대화형) 세션을 기록하고 제어문자를 정리해 로그에 붙이는 헬퍼
#   docker run -it 은 가상 터미널(TTY)을 요구해서 일반 파이프로는 기록할 수 없다.
#   macOS 내장 script 명령으로 가상 터미널을 할당해 진짜 대화형 세션을 남긴다.
# ---------------------------------------------------------------------------
log_tty() {
  local cmdline="$1"; shift
  local raw; raw="$(mktemp)"
  script -q "$raw" "$@" >/dev/null 2>&1
  {
    printf '\n$ %s\n' "$cmdline"
    perl -pe 's/\e\[[0-9;?]*[a-zA-Z]//g; s/\e\][^\a]*\a//g; s/\e[=>]//g; s/\r//g' < "$raw" \
      | col -bx | sed -n '/^bash-/,$p'
  } | tee -a "$LOGFILE"
  rm -f "$raw"
}

# =============================================================================
lognote "[1] hello-world 실행 — Docker 설치가 정상인지 확인하는 표준 테스트"
lognote "      이 이미지는 메시지를 출력하고 곧바로 종료한다."
logrun docker run --name hello-test hello-world

lognote "[1-1] 종료된 컨테이너도 기록에 남는다 — docker ps -a 로 확인"
logrun docker ps -a --filter name=hello-test --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'

# =============================================================================
lognote "[2] ubuntu 컨테이너 실행 후 내부 진입 — docker run -it"
lognote "      -i = 입력을 열어둠, -t = 가상 터미널 할당."
lognote "      아래 'bash-5.2#' 이 컨테이너 내부의 프롬프트다. 즉 컨테이너 안에 들어간 상태."
log_tty 'docker run -it --rm --name ubuntu-lab ubuntu:24.04 bash' \
  docker run -it --rm --name ubuntu-lab -e TERM=dumb ubuntu:24.04 bash --noprofile --norc <<'EOS'
pwd
ls
echo "hello from ubuntu container"
whoami
cat /etc/os-release
exit
EOS

lognote "[2-1] exit 로 나오면 컨테이너도 함께 종료된다 (--rm 을 줬으므로 기록도 삭제됨)"
logrun docker ps -a --filter name=ubuntu-lab

# =============================================================================
lognote "[3] === 컨테이너 종료/유지의 차이 관찰: attach vs exec ==="

lognote "[3-0] 1초마다 숫자를 출력하는 컨테이너를 백그라운드(-d)로 실행"
logrun docker run -d --name tick-demo ubuntu:24.04 sh -c 'i=1; while true; do echo "tick $i"; i=$((i+1)); sleep 1; done'
sleep 4

lognote "[3-1] docker logs — 컨테이너 '밖에서' 출력만 열람한다"
lognote "      컨테이너에 들어가지 않으므로 아무 영향도 주지 않는다."
logrun docker logs tick-demo
logrun docker ps --filter name=tick-demo --format 'table {{.Names}}\t{{.Status}}'

lognote "[3-2] docker exec — 실행 중인 컨테이너에 '새로운 별도 세션'을 하나 더 연다"
logrun docker exec tick-demo sh -c 'echo "exec 로 들어와서 실행한 명령입니다"; echo "---"; ls /'
lognote "      >>> 관찰: exec 를 마치고 빠져나와도 컨테이너는 그대로 Up 이다"
logrun docker ps --filter name=tick-demo --format 'table {{.Names}}\t{{.Status}}'

lognote "[3-3] docker attach — 컨테이너의 '메인 프로세스'가 쓰는 화면에 직접 연결한다"
lognote "      새 세션을 만드는 게 아니라 원래 돌아가던 프로세스에 붙는 것이다."
lognote "      그래서 여기서 Ctrl+C(SIGINT)를 누르면 그 신호가 메인 프로세스로 전달된다."

ATTACH_OUT="$(mktemp)"
docker attach tick-demo > "$ATTACH_OUT" 2>&1 &
ATTACH_PID=$!
sleep 3
kill -INT "$ATTACH_PID" 2>/dev/null || true
wait "$ATTACH_PID" 2>/dev/null || true
{
  printf '\n$ docker attach tick-demo\n'
  cat "$ATTACH_OUT"
  printf '^C          <-- 3초 뒤 Ctrl+C 로 빠져나옴\n'
} | tee -a "$LOGFILE"
rm -f "$ATTACH_OUT"
sleep 2

lognote "      >>> 관찰: attach 에서 Ctrl+C 로 나온 뒤의 컨테이너 상태"
logrun docker ps -a --filter name=tick-demo --format 'table {{.Names}}\t{{.Status}}'

# =============================================================================
lognote "[4] === Docker 기본 운영 명령 ==="

lognote "[4-0] 중지된 컨테이너를 다시 시작 — docker start"
logrun docker start tick-demo
sleep 3

lognote "[4-1] 실행 중인 컨테이너 목록 — docker ps"
logrun docker ps

lognote "[4-2] 종료된 것까지 포함한 전체 목록 — docker ps -a"
logrun docker ps -a

lognote "[4-3] 로그 확인 — docker logs (--tail 로 마지막 N줄만)"
logrun docker logs --tail 5 tick-demo

lognote "[4-4] 리소스 사용량 확인 — docker stats"
lognote "      docker stats 는 화면을 계속 갱신하는 실시간 모드라 로그로 남길 수 없다."
lognote "      --no-stream 을 붙이면 현재 시점 스냅샷 1회만 출력하고 종료한다."
logrun docker stats --no-stream

lognote "[4-5] 컨테이너 중지 — docker stop"
logrun docker stop tick-demo
logrun docker ps -a --filter name=tick-demo --format 'table {{.Names}}\t{{.Status}}'

lognote "[4-6] 컨테이너 삭제 — docker rm (실습 정리)"
logrun docker rm tick-demo hello-test
logrun docker ps -a

lognote "[완료] 컨테이너 실행 실습 및 기본 운영 명령 종료"
