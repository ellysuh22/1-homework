#!/usr/bin/env bash
# =============================================================================
#  Phase 8 — Docker 볼륨 영속성 검증
#  미션 4장 요구:
#    - Docker 볼륨을 생성하고 컨테이너에 연결한다
#    - 컨테이너 삭제 전/후로 데이터를 확인하여 데이터가 유지됨을 증명한다
#    - 생성/연결/검증 절차(명령+출력)를 포함한다
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/08-volume.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

docker rm -f vol-test vol-test2 novol-test novol-test2 >/dev/null 2>&1 || true
docker volume rm my-data >/dev/null 2>&1 || true

lognote "===================================================================="
lognote " 실험 A — 볼륨을 사용하면 컨테이너를 지워도 데이터가 남는다"
lognote "===================================================================="

lognote "[A-1] 볼륨 생성 — docker volume create"
logrun docker volume create my-data

lognote "[A-2] 볼륨 목록 확인 — docker volume ls"
logrun docker volume ls

lognote "[A-3] 볼륨 상세 확인 — docker volume inspect"
lognote "      Mountpoint 는 Docker 가 관리하는 저장 위치다. (컨테이너와 분리되어 있다)"
logrun docker volume inspect my-data

lognote "[A-4] 볼륨을 연결한 컨테이너 실행 — -v <볼륨이름>:<컨테이너경로>"
logrun docker run -d --name vol-test -v my-data:/data ubuntu:24.04 sleep infinity

lognote "[A-5] 연결 상태 확인 — Type 이 'volume' 인 것을 주목 (바인드 마운트는 'bind')"
logrun docker inspect vol-test --format '{{range .Mounts}}Type={{.Type}}  Name={{.Name}}  Destination={{.Destination}}{{println}}{{end}}'

lognote "[A-6] 컨테이너 안에서 볼륨에 데이터 기록"
logrun docker exec vol-test bash -c 'echo "이 데이터는 볼륨에 저장됩니다." > /data/hello.txt; date "+기록 시각: %Y-%m-%d %H:%M:%S" >> /data/hello.txt; cat /data/hello.txt'

lognote "[A-7] === 삭제 전 === 데이터가 확실히 있는지 확인"
logrun docker exec vol-test cat /data/hello.txt
logrun docker exec vol-test ls -la /data

lognote "[A-8] *** 컨테이너를 완전히 삭제한다 *** — docker rm -f"
logrun docker rm -f vol-test
logrun docker ps -a --filter name=vol-test

lognote "[A-9] 컨테이너는 사라졌지만 볼륨은 그대로 남아있는지 확인"
logrun docker volume ls

lognote "[A-10] === 삭제 후 === 새 컨테이너에 같은 볼륨을 연결해서 읽어본다"
logrun docker run -d --name vol-test2 -v my-data:/data ubuntu:24.04 sleep infinity
logrun docker exec vol-test2 cat /data/hello.txt

lognote ">>> 결과: 컨테이너를 지웠는데도 데이터가 그대로 살아있다. 이것이 '영속성'이다."

lognote ""
lognote "===================================================================="
lognote " 실험 B — 대조군: 볼륨 없이 하면 데이터가 사라진다"
lognote "===================================================================="

lognote "[B-1] 볼륨 연결 없이 컨테이너 실행"
logrun docker run -d --name novol-test ubuntu:24.04 sleep infinity

lognote "[B-2] 컨테이너 내부에 똑같이 파일 기록 (이번엔 볼륨이 아니라 컨테이너 자체 저장소)"
logrun docker exec novol-test bash -c 'echo "이 데이터는 컨테이너 안에만 있습니다." > /data-inside.txt; cat /data-inside.txt'

lognote "[B-3] === 삭제 전 === 파일 존재 확인"
logrun docker exec novol-test ls -l /data-inside.txt

lognote "[B-4] *** 컨테이너 삭제 ***"
logrun docker rm -f novol-test

lognote "[B-5] === 삭제 후 === 같은 이미지로 새 컨테이너를 띄워 같은 파일을 찾아본다"
logrun docker run -d --name novol-test2 ubuntu:24.04 sleep infinity
lognote "      아래 명령은 'No such file or directory' 로 실패해야 정상이다."
logrun docker exec novol-test2 cat /data-inside.txt

lognote ">>> 결과: 볼륨 없이 컨테이너 안에 저장한 데이터는 컨테이너와 함께 사라졌다."
lognote "         실험 A 와 B 를 비교하면 데이터를 지켜준 것이 '볼륨'임이 증명된다."

lognote ""
lognote "[정리] 실습 컨테이너 삭제 (볼륨은 남겨두어 증거로 보존)"
logrun docker rm -f vol-test2 novol-test2
logrun docker volume ls
logrun docker ps -a

lognote "[완료] 볼륨 영속성 검증 완료"
