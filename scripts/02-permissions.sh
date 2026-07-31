#!/usr/bin/env bash
# =============================================================================
#  Phase 2 — 파일 권한 실습
#  미션 4장 요구: 권한을 확인/변경하는 명령을 수행하고 변경 전/후 비교를 남긴다.
#                최소 요구 — 파일 1개, 디렉토리 1개에 대해 권한 변경 실험
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/02-permissions.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

lognote "[준비] 실습 대상 만들기 — 파일 1개 + 디렉토리 1개"
logrun mkdir -p practice/perm-demo
logsh 'echo "권한 실습용 파일입니다." > practice/perm-test.txt'
logsh 'echo "디렉토리 안에 들어있는 파일입니다." > practice/perm-demo/inside.txt'

lognote "[1] === 변경 전 === 권한 확인 (ls -l = 파일 / ls -ld = 디렉토리 자신의 정보)"
lognote "      새로 만든 파일은 기본 644(rw-r--r--), 디렉토리는 기본 755(rwxr-xr-x) 로 생성된다"
logrun ls -l practice/perm-test.txt
logrun ls -ld practice/perm-demo

lognote "[2-1] 파일 권한 변경: 644 -> 600  (rw- r-- r--  ->  rw- --- ---)"
lognote "      의미 — 소유자만 읽고 쓸 수 있고, 그룹/기타는 아무것도 못 하게 잠근다"
logrun chmod 600 practice/perm-test.txt
lognote "      === 변경 후 === 뒤쪽 6글자가 r--r-- 에서 ------ 로 바뀐 것을 확인"
logrun ls -l practice/perm-test.txt

lognote "[2-2] 디렉토리 권한 변경: 755 -> 700  (rwx r-x r-x  ->  rwx --- ---)"
lognote "      의미 — 소유자만 진입/목록조회 가능, 다른 사용자는 폴더에 못 들어온다"
logrun chmod 700 practice/perm-demo
lognote "      === 변경 후 ==="
logrun ls -ld practice/perm-demo

lognote "[2-3] 표준 권한으로 되돌리기 — 파일 644 / 디렉토리 755"
logrun chmod 644 practice/perm-test.txt
logrun chmod 755 practice/perm-demo
logrun ls -l practice/perm-test.txt
logrun ls -ld practice/perm-demo

lognote "[3] 권한이 '실제로' 작동하는지 검증 — 파일의 모든 권한을 제거(000)한 뒤 읽기 시도"
logrun chmod 000 practice/perm-test.txt
logrun ls -l practice/perm-test.txt
lognote "      아래 cat 은 Permission denied 로 실패해야 정상이다 (소유자여도 막힌다)"
logrun cat practice/perm-test.txt

lognote "[4] 권한 복구 후 다시 읽기 — 이번엔 성공해야 한다"
logrun chmod 644 practice/perm-test.txt
logrun ls -l practice/perm-test.txt
logrun cat practice/perm-test.txt

lognote "[5] 디렉토리의 x(실행) 권한은 '진입 권한'이다 — x 를 빼고 접근해 본다"
logrun chmod 644 practice/perm-demo
logrun ls -ld practice/perm-demo
lognote "      아래 ls 는 Permission denied 로 실패해야 정상이다 (x 가 없으면 폴더에 못 들어간다)"
logrun ls practice/perm-demo

lognote "[6] 디렉토리 권한 복구 — 755 로 되돌리면 다시 접근된다"
logrun chmod 755 practice/perm-demo
logrun ls -ld practice/perm-demo
logrun ls practice/perm-demo

lognote "[7] 기호 방식으로도 변경 가능 — chmod +x / chmod -x"
logrun chmod +x practice/perm-test.txt
logrun ls -l practice/perm-test.txt
logrun chmod -x practice/perm-test.txt
logrun ls -l practice/perm-test.txt

lognote "[완료] 권한 실습 종료 — 파일 1개(perm-test.txt) + 디렉토리 1개(perm-demo) 검증 완료"
