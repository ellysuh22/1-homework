#!/usr/bin/env bash
# =============================================================================
#  Phase 1 — 터미널 기본 조작 실습
#  미션 4장 요구: 현재 위치 확인 / 목록 확인(숨김 포함) / 이동 / 생성 /
#                복사 / 이동·이름변경 / 삭제 / 파일 내용 확인 / 빈 파일 생성
# =============================================================================
set -u
cd "$(dirname "$0")/.."
PROJECT_ROOT="$(pwd)"

export LOGFILE="logs/01-terminal.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

lognote "[1] 현재 위치 확인 — pwd"
logrun pwd

lognote "[2] 목록 확인 (숨김 파일 포함) — ls -la"
logrun ls -la

lognote "[2-1] 숨김 파일 없이 보면? — ls (.git, .gitignore 등이 보이지 않는다)"
logrun ls

lognote "[3] 디렉토리 생성 — mkdir -p (중간 경로까지 한 번에 생성)"
logrun mkdir -p practice/docs practice/backup
logrun ls -la practice

lognote "[4] 빈 파일 생성 — touch (크기 0 바이트로 만들어진다)"
logrun touch practice/empty-note.txt
logrun ls -l practice/empty-note.txt

lognote "[5] 파일에 내용 쓰고 확인 — cat"
logsh 'printf "첫 번째 줄입니다.\n두 번째 줄입니다.\n" > practice/hello.txt'
logrun cat practice/hello.txt

lognote "[6] 복사 — cp"
logrun cp practice/hello.txt practice/backup/hello-copy.txt
logrun ls -l practice/backup

lognote "[7] 이름 변경 — mv (같은 폴더 안에서 옮기면 이름 변경이 된다)"
logrun mv practice/backup/hello-copy.txt practice/backup/hello-renamed.txt
logrun ls -l practice/backup

lognote "[8] 이동 — mv (다른 폴더로 옮기기)"
logrun mv practice/empty-note.txt practice/docs/
logrun ls -l practice/docs

lognote "[9] 디렉토리 이동 — cd (절대 경로 vs 상대 경로 비교)"

lognote "[9-1] 절대 경로로 이동 — / 부터 전부 적는 방식. 어디서 실행하든 같은 곳으로 간다"
logcd "$PROJECT_ROOT/practice/docs"
logrun pwd

lognote "[9-2] 상대 경로로 이동 — .. 는 부모 폴더. 지금 위치가 기준이 된다"
logcd ".."
logrun pwd

lognote "[9-3] 같은 파일을 두 방식으로 접근 — 결과가 완전히 동일함을 확인"
logrun cat "$PROJECT_ROOT/practice/hello.txt"
logrun cat ./hello.txt

lognote "[9-4] 상대 경로는 '현재 위치'가 바뀌면 가리키는 대상도 바뀐다"
logcd "$PROJECT_ROOT/practice/docs"
logrun pwd
logrun cat ./hello.txt

logcd "$PROJECT_ROOT"

lognote "[10] 삭제 — rm (파일) / rm -r (폴더째)"
logrun rm practice/backup/hello-renamed.txt
logrun ls -la practice/backup
logrun rm -r practice/backup
logrun ls -la practice

lognote "[완료] 터미널 기본 조작 9종 실습 종료"
logrun pwd
