#!/usr/bin/env bash
# =============================================================================
#  Phase 5 — 기존 Dockerfile 기반 커스텀 이미지 제작
#  미션 4장 요구:
#    - (A) 웹 서버 베이스 이미지 활용 + 정적 콘텐츠/설정만 교체
#    - 커스텀 이미지 빌드 성공 및 컨테이너 실행 성공
#    - 빌드/실행 명령 + 핵심 결과
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/05-image-build.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

docker rm -f web-8080 >/dev/null 2>&1 || true
docker rmi -f my-web:1.0 >/dev/null 2>&1 || true

lognote "[1] 빌드 재료 확인 — Dockerfile 과 COPY 대상"
logrun ls -la Dockerfile app templates

lognote "[2] 내가 직접 작성한 Dockerfile 전문"
logrun cat Dockerfile

lognote "[3] nginx 설정 템플릿 — listen 포트를 환경변수로 받는 부분이 핵심"
logrun cat templates/default.conf.template

lognote "[4] 이미지 빌드 — docker build"
lognote "      -t my-web:1.0  = 만들 이미지에 붙일 이름:태그"
lognote "      .              = 빌드 재료(빌드 컨텍스트)가 있는 위치 = 현재 폴더"
lognote "      --progress=plain = 진행률 애니메이션 대신 평문 출력 (로그로 남기기 위함)"
logrun docker build --progress=plain -t my-web:1.0 .

lognote "[5] 빌드된 이미지 확인 — docker images"
logrun docker images

lognote "[6] 커스텀 포인트가 이미지에 실제로 박혔는지 검증 — docker inspect"

lognote "[6-1] 커스텀 ① LABEL (이미지 메타데이터)"
logrun docker inspect my-web:1.0 --format '{{json .Config.Labels}}'

lognote "[6-2] 커스텀 ② ENV (환경변수 기본값)"
logrun docker inspect my-web:1.0 --format '{{range .Config.Env}}{{println .}}{{end}}'

lognote "[6-3] 커스텀 ⑤ EXPOSE (사용 포트 선언)"
logrun docker inspect my-web:1.0 --format '{{json .Config.ExposedPorts}}'

lognote "[6-4] 커스텀 ⑥ HEALTHCHECK (상태 점검 방법)"
logrun docker inspect my-web:1.0 --format '{{json .Config.Healthcheck}}'

lognote "[7] 컨테이너 실행 — docker run"
lognote "      -d = 백그라운드 실행, -p 8080:80 = 포트 매핑, --name = 컨테이너 이름"
logrun docker run -d -p 8080:80 --name web-8080 my-web:1.0

lognote "[8] 헬스체크가 실제로 통과하는지 확인 (Docker 가 10초마다 자동 점검)"
lognote "      starting -> healthy 로 바뀌면 '떠 있을 뿐 아니라 정상 응답한다'는 뜻이다."
sleep 2
logrun docker inspect web-8080 --format 'Health: {{.State.Health.Status}}'
sleep 10
logrun docker inspect web-8080 --format 'Health: {{.State.Health.Status}}'
logrun docker ps --filter name=web-8080

lognote "[9] 실행 중인 컨테이너에 응답 요청 — curl"
logrun curl -sS -i http://localhost:8080

lognote "[10] 설정 템플릿이 실제로 치환됐는지 확인"
lognote "      템플릿의 \${APP_PORT} 가 실제 값 80 으로 바뀌어 conf 파일이 생성됐어야 한다."
logrun docker exec web-8080 cat /etc/nginx/conf.d/default.conf

lognote "[11] 컨테이너 시작 로그에서 envsubst 동작 확인 — docker logs"
logrun docker logs web-8080

lognote "[12] 환경변수 확인용 엔드포인트 응답"
logrun curl -sS http://localhost:8080/env

lognote "[완료] 커스텀 이미지 빌드 및 실행 성공"
