#!/usr/bin/env bash
# =============================================================================
#  Phase 10 — GitHub SSH 키 설정 (보너스 과제)
#  미션 5장 보너스 요구:
#    - HTTPS 대신 SSH 로 푸시가 가능하도록 키를 등록하고 동작을 확인한다
#    - 배움 포인트: 인증 방식 차이와 보안 습관
#
#  설계 의도:
#    "동작을 확인한다" 를 성공 화면 하나로 끝내지 않는다.
#    Phase 2(권한) 에서 chmod 000 → Permission denied 로 권한의 실효성을 증명했고,
#    Phase 8(볼륨) 에서 볼륨 없는 대조군으로 영속성을 증명했다.
#    같은 방식으로 여기서도 "키가 없으면 거부된다" 는 대조군을 만든다.
#    성공 화면만 있으면 "원래 열려 있던 문 아니냐" 는 반문에 답할 수 없다.
#
#  왜 단계를 나눴는가:
#    공개키를 GitHub 에 등록하는 절차는 GitHub 계정 소유자만 할 수 있다.
#    (CLI 로 하려면 토큰에 admin:public_key 권한이 필요한데 이 환경에는 없다)
#    그래서 '등록 전' 과 '등록 후' 를 물리적으로 분리했다.
#
#  실행:
#    bash scripts/10-ssh-key.sh setup     # 등록 전 — 상태기록 + 키생성 + 설정
#    (GitHub 웹에서 공개키 등록)
#    bash scripts/10-ssh-key.sh verify    # 등록 후 — 실험 A/B/C + 보안점검
#
#  선택 환경변수:
#    KEY_PASSPHRASE   설정하면 비대화형으로 키를 만든다. 없으면 직접 입력받는다.
# =============================================================================
set -u
cd "$(dirname "$0")/.."

STAGE="${1:-}"
KEY="$HOME/.ssh/id_ed25519"
REPO_SSH="git@github.com:ellysuh22/1-homework.git"
EMAIL="cindyseo79@gmail.com"

case "$STAGE" in
  setup|verify) ;;
  *) echo "사용법: bash scripts/10-ssh-key.sh {setup|verify}" >&2; exit 2 ;;
esac

export LOGFILE="logs/10-ssh-key.log"
[ "$STAGE" = "setup" ] && rm -f "$LOGFILE"   # setup 이 로그를 새로 시작한다
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh


# ###########################################################################
# ##  STAGE 1 : setup — 공개키를 GitHub 에 등록하기 '전' 까지
# ###########################################################################
if [ "$STAGE" = "setup" ]; then

lognote "===================================================================="
lognote " 단계 0 — [Before] 전환 전 상태 고정"
lognote "===================================================================="
lognote "대조군은 실험 '전' 에 확보해야 한다. 바꾸고 나면 되살릴 수 없다."
lognote "미션이 'HTTPS 대신 SSH' 라고 했으므로, 원래 HTTPS 였다는 기록이 있어야"
lognote "'대신했다' 를 증명할 수 있다."

lognote "[0-1] 현재 원격 저장소 주소 — https:// 로 시작하는지 확인"
logrun git remote -v

lognote "[0-2] 현재 인증 방식 — HTTPS 는 credential helper(토큰) 를 거친다"
lognote "      helper 에는 '프로그램 경로' 만 남고 토큰 값은 macOS 키체인에 따로 있다"
logsh 'git config --list | grep -i credential'

lognote "[0-3] SSH 키 보유 현황 — 아직 개인키/공개키가 없는 상태"
logrun ls -la "$HOME/.ssh"


lognote ""
lognote "===================================================================="
lognote " 단계 1 — 키 생성 (ed25519)"
lognote "===================================================================="
lognote "ed25519 를 선택한 이유: RSA 보다 키가 짧고 빠르면서 안전하다. GitHub 권장 방식."
lognote "생성 결과는 두 개다."
lognote "  · id_ed25519      개인키 = 열쇠. 내 컴퓨터 밖으로 절대 안 나간다."
lognote "  · id_ed25519.pub  공개키 = 자물쇠. GitHub 에 붙여둔다. 공개돼도 안전하다."

if [ -f "$KEY" ]; then
  lognote "[1-1] 이미 키가 존재하므로 생성을 건너뛴다 (재실행 안전성)"
elif [ -n "${KEY_PASSPHRASE+x}" ]; then
  lognote "[1-1] 키 생성 (비대화형)"
  logsh "ssh-keygen -t ed25519 -C '$EMAIL' -f '$KEY' -N '${KEY_PASSPHRASE}' -q && echo '키 생성 완료'"
else
  lognote "[1-1] 키 생성 — passphrase 입력은 화면에 보여야 하므로 직접 실행한다"
  printf '\n### passphrase 를 입력하세요 (화면에 표시되지 않습니다)\n'
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY"
  { printf '\n$ ssh-keygen -t ed25519 -C "<이메일>" -f ~/.ssh/id_ed25519\n'
    printf '(passphrase 입력 — 대화형이므로 화면 출력은 생략. 결과는 아래 파일 목록으로 확인)\n'
  } >> "$LOGFILE"
fi

lognote "[1-2] 생성 결과 확인"
lognote "      개인키 권한이 600(-rw-------) 인지 주목한다. Phase 2 에서 다룬 그 표기다."
lognote "      SSH 는 개인키가 남에게 읽히는 권한이면 아예 사용을 거부한다."
logrun ls -la "$HOME/.ssh"

lognote "[1-3] 키 지문(fingerprint) — 공개키를 요약한 값. 공개 정보라 로그에 남겨도 안전하다."
lognote "      GitHub 등록 화면에 뜨는 지문과 대조하면 '내 키가 맞다' 는 교차 검증이 된다."
logsh "ssh-keygen -lf $KEY.pub"


lognote ""
lognote "===================================================================="
lognote " 단계 2 — ssh-agent / 키체인 연동 + 서버 신원 등록"
lognote "===================================================================="
lognote "passphrase 가 귀찮아서 passphrase 자체를 포기하는 것이 제일 나쁜 선택이다."
lognote "그래서 macOS 키체인에 맡겨 '보안은 지키고 불편만 없애는' 쪽으로 설정한다."

lognote "[2-1] ~/.ssh/config 에 github.com 전용 설정 추가"
lognote "      주의: 파일 맨 위의 OrbStack 'Include' 줄은 맨 위에 있어야 동작하므로"
lognote "            새 블록은 반드시 파일 '맨 아래' 에 덧붙인다."
if grep -q "^Host github.com" "$HOME/.ssh/config" 2>/dev/null; then
  lognote "      이미 설정되어 있어 건너뛴다 (재실행 안전성)"
else
  cat >> "$HOME/.ssh/config" <<'EOF'

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
  lognote "      추가 완료"
fi
logsh "tail -n 5 ~/.ssh/config"

lognote "[2-2] 키를 ssh-agent 에 등록 (passphrase 를 macOS 키체인에 위임)"
if [ -n "${KEY_PASSPHRASE+x}" ]; then
  logsh "ssh-add --apple-use-keychain '$KEY' 2>&1"
else
  printf '\n### 키 등록 — passphrase 를 물어보면 입력하세요\n'
  ssh-add --apple-use-keychain "$KEY"
  { printf '\n$ ssh-add --apple-use-keychain ~/.ssh/id_ed25519\n(대화형 — 결과는 아래 목록으로 확인)\n'; } >> "$LOGFILE"
fi

lognote "[2-3] agent 가 키를 들고 있는지 확인"
logrun ssh-add -l

lognote "[2-4] 서버 신원 등록 — known_hosts"
lognote "      SSH 는 '양방향' 확인이다."
lognote "        · 서버가 나를 확인   → 내 공개키로 서명을 검증"
lognote "        · 내가 서버를 확인   → 서버 호스트키를 known_hosts 와 대조"
lognote "      처음 접속할 때 뜨는 'Are you sure you want to continue connecting?' 이 그것이다."
lognote "      여기서는 그 절차를 ssh-keyscan 으로 명시적으로 수행해 기록에 남긴다."
if ssh-keygen -F github.com >/dev/null 2>&1; then
  lognote "      이미 등록되어 있어 건너뛴다"
else
  ssh-keyscan -t ed25519 github.com >> "$HOME/.ssh/known_hosts" 2>/dev/null
  lognote "      등록 완료"
fi
lognote "      아래 지문을 GitHub 공식 문서의 게시값과 육안 대조한다."
lognote "      (docs.github.com → \"GitHub's SSH key fingerprints\")"
logsh "ssh-keygen -lF github.com"


lognote ""
lognote "===================================================================="
lognote " 단계 3 — GitHub 에 등록할 공개키"
lognote "===================================================================="
lognote "저장소와 GitHub 으로 나가는 것은 '자물쇠(공개키)' 뿐이다."
lognote "'열쇠(개인키)' 는 ~/.ssh/ 밖으로 절대 나가지 않는다."

lognote "[3-1] 등록할 공개키 — 공개해도 안전한 값이므로 로그에 그대로 남긴다"
logsh "cat $KEY.pub"

pbcopy < "$KEY.pub" 2>/dev/null && printf '\n### 공개키를 클립보드에 복사했습니다.\n'

cat <<'GUIDE'

  ┌──────────────────────────────────────────────────────────────┐
  │  GitHub 에서 아래를 수행하세요 (이 단계만 GUI)                │
  │                                                              │
  │   1. github.com → 우측 상단 프로필 → Settings                │
  │   2. 좌측 메뉴 → SSH and GPG keys                            │
  │   3. [New SSH key] 클릭                                      │
  │        Title    : MacBook - 1-homework                       │
  │        Key type : Authentication Key                         │
  │        Key      : Cmd+V (이미 복사돼 있음)                    │
  │   4. [Add SSH key]                                           │
  │   5. 등록된 목록 화면을 캡처                                  │
  │        → evidence/github-ssh-key.png 로 저장                 │
  │        (지문이 보이게 찍으면 [1-3] 값과 대조 가능)            │
  │                                                              │
  │  끝나면:  bash scripts/10-ssh-key.sh verify                  │
  └──────────────────────────────────────────────────────────────┘

GUIDE
printf '✅ setup 완료 — 로그: %s\n\n' "$LOGFILE"
fi


# ###########################################################################
# ##  STAGE 2 : verify — 공개키를 등록한 '후' 검증
# ###########################################################################
if [ "$STAGE" = "verify" ]; then

lognote ""
lognote "[3-2] GitHub 웹에서 공개키 등록 완료 (증거: evidence/github-ssh-key.png)"

lognote ""
lognote "===================================================================="
lognote " 실험 A — 키가 있으면 인증에 성공한다"
lognote "===================================================================="

lognote "[A-1] SSH 인증 시도"
lognote "      종료 코드 1 이 정상이다. GitHub 은 로그인 셸을 주지 않고 git 통신만 허용하므로"
lognote "      'shell access 를 제공하지 않는다' 는 안내와 함께 1 로 끝난다."
logrun ssh -T git@github.com

lognote ">>> 결과: 'Hi <계정명>! You've successfully authenticated' — 신원 확인 성공."


lognote ""
lognote "===================================================================="
lognote " 실험 B — 대조군: 키를 못 쓰게 하면 거부된다"
lognote "===================================================================="
lognote "Phase 2 에서 chmod 000 을 걸고 cat 을 해 Permission denied 를 받아낸 것과 같다."
lognote "성공만 보여주면 '원래 열려 있던 문' 인지 '키 때문에 열린 문' 인지 구분할 수 없다."
lognote ""
lognote "옵션 설명:"
lognote "  -F /dev/null            ~/.ssh/config 를 아예 읽지 않는다  ★ 이게 없으면 실험이 실패한다"
lognote "  IdentitiesOnly=yes      지정한 키만 쓴다 (다른 키를 자동으로 찾지 않음)"
lognote "  IdentityAgent=none      ssh-agent 를 쓰지 않는다 (메모리에 올려둔 키 차단)"
lognote "  IdentityFile=/dev/null  빈 파일을 키로 지정 = 사실상 키 없음"
lognote "  BatchMode=yes           암호를 묻지 않고 즉시 실패 (스크립트가 멈추지 않도록)"
lognote ""
lognote "※ -F /dev/null 을 빠뜨리면 단계 2-1 에서 넣은 config 의 IdentityFile 이 살아남아"
lognote "  '키 없음' 을 만들었는데도 인증이 통과해버린다. 실제로 겪었고 README 16-6 에 정리했다."
lognote "※ 읽기 전용 시도이므로 저장소에는 아무 영향이 없다."

lognote "[B-1] 키 없이 인증 시도 — 'Permission denied (publickey)' 로 실패해야 정상이다"
logsh 'ssh -T -F /dev/null -o IdentitiesOnly=yes -o IdentityAgent=none -o IdentityFile=/dev/null -o BatchMode=yes git@github.com'

lognote "[B-2] 대조 근거 — 위 실패가 '키가 없어서' 임을 -v 로 확인한다"
lognote "      정상 경로에서는 'Offering public key: ...id_ed25519' 가 찍히지만"
lognote "      여기서는 제시할 키가 없어 곧바로 거부된다."
logsh 'ssh -T -F /dev/null -o IdentitiesOnly=yes -o IdentityAgent=none -o IdentityFile=/dev/null -o BatchMode=yes -v git@github.com 2>&1 | grep -E "identity file|Offering|Authentications that can continue|Permission denied" | head -5'

lognote ">>> 결과: 키를 차단하니 거부됐다. 실험 A 와 비교하면 통과시킨 것이 '키' 임이 증명된다."


lognote ""
lognote "===================================================================="
lognote " 실험 C — HTTPS 에서 SSH 로 전환하고 통신을 확인한다"
lognote "===================================================================="

lognote "[C-1] === 전환 전 === (단계 0 과 같은 값이어야 한다)"
logrun git remote -v

lognote "[C-2] *** 원격 주소를 SSH 형식으로 교체 ***"
lognote "      https://github.com/<계정>/<저장소>.git  →  git@github.com:<계정>/<저장소>.git"
logrun git remote set-url origin "$REPO_SSH"

lognote "[C-3] === 전환 후 === git@ 형식으로 바뀌었는지 확인"
logrun git remote -v

lognote "[C-4] 전환된 경로로 실제 통신이 되는지 확인 (원격 브랜치 조회)"
lognote "      토큰을 한 번도 쓰지 않고 키만으로 원격에 닿는다."
logrun git ls-remote --heads origin

lognote ">>> 결과: 인증 수단이 '토큰 전송' 에서 '키 서명' 으로 완전히 교체됐다."


lognote ""
lognote "===================================================================="
lognote " 단계 4 — 보안 점검 (개인키가 저장소에 섞이지 않았는지)"
lognote "===================================================================="
lognote "미션 4장: '토큰, 비밀번호, 개인키가 포함되지 않도록 마스킹한다'"

lognote "[4-1] 저장소 안에 개인키 파일이 있는지 검사 — 아무것도 안 나와야 정상"
logsh 'find . -path ./.git -prune -o -name "id_*" -print 2>/dev/null; echo "(검사 완료 — 위에 아무것도 없으면 통과)"'

lognote "[4-2] 이번 로그에 개인키 본문이 섞였는지 검사 — 0 이어야 정상"
logsh 'grep -c "PRIVATE KEY" logs/10-ssh-key.log || true'

lognote "[4-3] 개인키는 저장소 밖(~/.ssh/)에만 존재하며 권한이 600 인지 재확인"
logsh "ls -l $KEY"

lognote ""
lognote "[완료] SSH 키 설정 및 동작 검증 완료"
lognote "       남은 단계: 문서 반영 후 scripts/10b-ssh-push.sh 로 실제 push 증거 수집"

printf '\n✅ verify 완료 — 로그: %s\n\n' "$LOGFILE"
fi
