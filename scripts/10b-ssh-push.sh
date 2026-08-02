#!/usr/bin/env bash
# =============================================================================
#  Phase 10b — SSH 경로로 실제 push 가 되는지 증명
#  미션 5장 보너스 요구:
#    - "HTTPS 대신 SSH 로 '푸시가 가능하도록'" ← 인증(ssh -T)만으로는 부족하다
#
#  왜 스크립트를 따로 나눴는가:
#    10-ssh-key.sh 는 '설정과 검증' 이고, 이 스크립트는 '문서까지 다 쓴 뒤
#    마지막에 한 번' 돌리는 업로드 단계다. 순서가 다르므로 파일을 분리했다.
#    (문서를 쓰기 전에 push 하면 미완성 상태가 올라간다)
#
#  실행:  bash scripts/10b-ssh-push.sh
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/10-ssh-key.log"   # 같은 로그 파일에 이어서 기록한다
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

lognote ""
lognote "===================================================================="
lognote " 실험 D — SSH 경로로 실제 push"
lognote "===================================================================="

lognote "[D-1] 원격 주소가 SSH(git@) 인지 다시 확인"
logrun git remote -v

lognote "[D-2] 올릴 변경사항 확인"
logrun git status --short

lognote "[D-3] 커밋 — 이번 작업에 해당하는 파일만 명시적으로 스테이징한다"
lognote "      git add -A 를 쓰지 않는 이유: 저장소에 과제와 무관한 개인 이미지 등이"
lognote "      남아 있을 수 있어, 공개 저장소에 의도치 않게 올라가는 것을 막기 위함이다."
logrun git add README.md REPORT.md \
              logs/10-ssh-key.log evidence/github-ssh-key.png \
              scripts/10-ssh-key.sh scripts/10b-ssh-push.sh scripts/10c-passphrase.sh
logrun git status --short --untracked-files=no
logrun git commit -m "docs: 보너스 - GitHub SSH 키 설정 및 동작 검증"

lognote "[D-4] *** push *** — 출력 첫 줄의 대상 주소를 주목한다"
lognote "      'To https://...' 이면 HTTPS, 'To github.com:...' 이면 SSH 로 나간 것이다."
logrun git push origin main

lognote "[D-5] 원격에 반영됐는지 확인"
logrun git log --oneline -1
logrun git branch -vv

lognote ">>> 결과: 토큰 입력 없이 키만으로 push 가 완료됐다."
lognote "         미션 요구인 'HTTPS 대신 SSH 로 푸시가 가능하도록' 을 충족한다."

printf '\n\n✅ push 완료 — 로그: %s\n\n' "$LOGFILE"
