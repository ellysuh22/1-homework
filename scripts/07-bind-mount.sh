#!/usr/bin/env bash
# =============================================================================
#  Phase 7 — 바인드 마운트 반영 검증
#  미션 2장 요구: 바인드 마운트 — 실행 명령 + 호스트 변경 전/후 비교
#  미션 7장 요구: 마운트는 직접 설정하고 동작을 검증해야 한다
# =============================================================================
set -u
cd "$(dirname "$0")/.."
PROJECT_ROOT="$(pwd)"

export LOGFILE="logs/07-bind-mount.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

docker rm -f web-bind >/dev/null 2>&1 || true

# 실습 시작 상태로 초기화 (v1)
cat > bindmount-demo/index.html <<'EOS'
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>바인드 마운트 실습 — v1</title>
  <style>
    body {
      margin: 0; min-height: 100vh; display: grid; place-items: center;
      background: #0f172a; color: #e2e8f0;
      font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo", sans-serif;
    }
    .box {
      padding: 2.5rem 3rem; border-radius: 16px;
      background: #1e293b; border: 2px solid #fbbf24; text-align: center;
    }
    .ver { font-size: 3rem; font-weight: 700; color: #fbbf24; margin: 0 0 .5rem; }
    p { margin: .25rem 0; color: #94a3b8; }
    code { color: #38bdf8; }
  </style>
</head>
<body>
  <div class="box">
    <p class="ver">v1</p>
    <p>이 파일은 <strong>호스트 폴더</strong>에서 옵니다</p>
    <p><code>bindmount-demo/index.html</code></p>
    <p>수정 전 상태</p>
  </div>
</body>
</html>
EOS

lognote "[1] 바인드 마운트란 — 호스트(내 맥)의 폴더를 컨테이너 안 경로에 그대로 연결하는 것"
lognote "      -v <호스트경로>:<컨테이너경로> 형식으로 지정한다."
lognote "      호스트경로는 반드시 절대경로여야 하므로 \$(pwd) 를 사용한다."

lognote "[2] 마운트할 호스트 폴더의 현재 내용 확인"
logrun ls -la bindmount-demo
logsh 'grep -o "v1" bindmount-demo/index.html | head -1'

lognote "[3] 바인드 마운트로 컨테이너 실행"
lognote "      컨테이너 안 /usr/share/nginx/html 자리에 호스트 폴더가 '덮어씌워' 연결된다."
lognote "      그래서 이미지에 들어있던 app/index.html 은 가려지고 호스트 파일이 보이게 된다."
logrun docker run -d -p 8082:80 -v "$PROJECT_ROOT/bindmount-demo:/usr/share/nginx/html" --name web-bind my-web:1.0
sleep 3

logrun docker ps --filter name=web-bind --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'

lognote "[4] 마운트 설정이 실제로 걸렸는지 확인 — docker inspect"
logrun docker inspect web-bind --format '{{range .Mounts}}Type={{.Type}}  Source={{.Source}}  Destination={{.Destination}}{{println}}{{end}}'

lognote "[5] === 변경 전 === 호스트 파일 수정 전의 응답"
logsh 'curl -sS http://localhost:8082 | grep -E "ver\">|수정" '

lognote "[6] 컨테이너 안에서도 같은 파일이 보이는지 확인 (호스트 파일이 그대로 들어와 있다)"
logrun docker exec web-bind sh -c 'ls -la /usr/share/nginx/html && echo "---" && grep -o "v1" /usr/share/nginx/html/index.html | head -1'

lognote "[7] *** 호스트에서 파일을 수정한다 *** (컨테이너는 건드리지 않는다)"
lognote "      v1 -> v2 로 바꾸고, 재빌드도 재시작도 하지 않는다."
logsh "sed -i '' 's|>v1<|>v2<|; s|바인드 마운트 실습 — v1|바인드 마운트 실습 — v2|; s|수정 전 상태|수정 후 상태 (호스트에서 방금 고침)|' bindmount-demo/index.html"
logsh 'grep -o "v2" bindmount-demo/index.html | head -1'

lognote "[8] === 변경 후 === 재빌드/재시작 없이 곧바로 다시 요청해 본다"
logsh 'curl -sS http://localhost:8082 | grep -E "ver\">|수정"'

lognote "[9] 컨테이너 안에서도 즉시 바뀌었는지 확인"
logrun docker exec web-bind sh -c 'grep -o "v2" /usr/share/nginx/html/index.html | head -1'

lognote "[10] 대조 — 바인드 마운트를 안 건 컨테이너(8080)는 이미지 내장 콘텐츠 그대로다"
logsh 'curl -sS http://localhost:8080 | grep -o "이미지 내장 (app/index.html)"'

lognote ">>> 결론: 바인드 마운트를 걸면 호스트 파일 수정이 컨테이너에 즉시 반영된다."
lognote "         이미지를 다시 빌드하거나 컨테이너를 재시작할 필요가 없다."
lognote "         그래서 개발 중 코드를 고쳐가며 확인할 때 유용하다."

lognote "[11] 실습 컨테이너 정리"
logrun docker rm -f web-bind

lognote "[완료] 바인드 마운트 반영 검증 완료"
