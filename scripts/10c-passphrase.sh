#!/usr/bin/env bash
# =============================================================================
#  Phase 10c — 개인키에 passphrase 걸기 (보안 습관)
#  미션 5장 보너스 배움 포인트: "인증 방식 차이와 보안 습관"
#
#  무엇을 증명하는가:
#    개인키 파일 자체가 유출돼도 passphrase 없이는 쓸 수 없다는 것.
#    "키를 가졌다 = 들어갈 수 있다" 가 아니라 한 겹이 더 있다는 것을 전/후로 보인다.
#
#  검사 방법:
#    ssh-keygen -y -P '' -f <키>
#      → 빈 암호로 개인키를 열어보는 명령이다.
#        암호가 없으면 공개키가 출력되며 성공(0),
#        암호가 걸려 있으면 복호화에 실패한다(비0).
#      이 명령으로 '암호 유무' 를 눈에 보이는 결과로 만들 수 있다.
#
#  실행:  bash scripts/10c-passphrase.sh
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/10-ssh-key.log"   # 같은 로그에 이어서 기록
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

KEY="$HOME/.ssh/id_ed25519"

lognote ""
lognote "===================================================================="
lognote " 실험 E — 개인키에 passphrase 를 걸어 한 겹 더 잠근다 (보안 습관)"
lognote "===================================================================="

lognote "[E-1] === 변경 전 === 빈 암호로 개인키가 열리는지 검사"
lognote "      공개키가 출력되면 = 암호가 걸려있지 않다는 뜻이다."
logsh "ssh-keygen -y -P '' -f $KEY && echo '판정: 암호 없음 (파일만 있으면 누구나 사용 가능)'"

printf '\n'
printf '  ┌────────────────────────────────────────────────────────────┐\n'
printf '  │  지금부터 새 passphrase 를 입력합니다.                      │\n'
printf '  │    · 기존 암호가 없으므로 바로 새 암호를 물어봅니다          │\n'
printf '  │    · 화면에 아무것도 안 보이는 것이 정상입니다               │\n'
printf '  │    · 같은 값을 두 번 입력하세요                             │\n'
printf '  │    · 잊어버리면 키를 새로 만들어야 하니 기억할 것으로        │\n'
printf '  └────────────────────────────────────────────────────────────┘\n\n'

ssh-keygen -p -f "$KEY"
{ printf '\n$ ssh-keygen -p -f ~/.ssh/id_ed25519\n'
  printf '(passphrase 입력 — 대화형이므로 화면 출력은 생략. 결과는 아래 검사로 확인)\n'
} >> "$LOGFILE"

lognote "[E-2] === 변경 후 === 같은 검사를 다시 한다"
lognote "      이번에는 실패해야 정상이다. 빈 암호로는 더 이상 개인키를 열 수 없다."
logsh "ssh-keygen -y -P '' -f $KEY || echo '판정: 암호 걸림 (파일만으로는 사용 불가)'"

# 결론은 '실제 검사 결과' 로부터 만든다.
#   문구를 미리 박아두면 실패했는데도 성공했다고 적히는 사고가 난다. (실제로 겪음)
if ssh-keygen -y -P '' -f "$KEY" >/dev/null 2>&1; then
  lognote ">>> 결과: 암호가 걸리지 않았다. (입력 단계에서 빈 값이 들어간 것으로 보인다)"
  lognote "         현재 키는 파일만 있으면 그대로 사용 가능한 상태다."
  lognote "         → scripts/10c-passphrase.sh 를 다시 실행해 암호를 설정해야 한다."
  PASS_SET=0
else
  lognote ">>> 결과: 키 파일이 통째로 유출돼도 passphrase 없이는 쓸 수 없는 상태가 됐다."
  lognote "         Phase 2 의 파일 권한이 '누가 열 수 있나' 였다면,"
  lognote "         passphrase 는 '열쇠를 가졌어도 한 번 더 확인한다' 는 두 번째 방어선이다."
  PASS_SET=1
fi

lognote ""
lognote "[E-3] 키체인에 다시 등록 — 매번 입력하는 불편을 없앤다"
lognote "      불편해서 passphrase 를 포기하는 것이 가장 나쁜 선택이므로,"
lognote "      보안은 지키고 불편만 macOS 키체인에 넘긴다."
printf '\n### 키체인 등록 — passphrase 를 한 번만 더 입력하세요\n'
ssh-add --apple-use-keychain "$KEY"
{ printf '\n$ ssh-add --apple-use-keychain ~/.ssh/id_ed25519\n(대화형 — 결과는 아래 확인)\n'; } >> "$LOGFILE"

lognote "[E-4] agent 등록 상태 및 인증 재확인 — 암호를 걸어도 정상 동작하는지"
logrun ssh-add -l
logrun ssh -T git@github.com

if [ "$PASS_SET" = "1" ]; then
  lognote ">>> 결과: passphrase 를 건 뒤에도 인증은 그대로 성공한다."
  lognote "         보안을 올리면서 사용성은 잃지 않았다."
  printf '\n✅ passphrase 설정 완료 — 로그: %s\n\n' "$LOGFILE"
else
  lognote ">>> 결과: 인증 자체는 성공하지만, 암호가 걸리지 않아 [E-2] 가 미완이다."
  printf '\n⚠️  passphrase 가 설정되지 않았습니다 (빈 값 입력).\n'
  printf '    다시 실행하려면:  bash scripts/10c-passphrase.sh\n'
  printf '    이번에는 "Enter new passphrase" 에서 반드시 글자를 입력하세요.\n\n'
fi
