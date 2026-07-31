#!/usr/bin/env bash
# =============================================================================
#  Phase 6 — 포트 매핑 및 접속 증거
#  미션 4장/7장 요구:
#    - -p <host_port>:<container_port> 로 실행 후 접속 확인
#    - 포트 매핑은 직접 설정하고 동작을 검증해야 한다
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/06-port-mapping.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

docker rm -f web-8081 >/dev/null 2>&1 || true

lognote "[1] 포트 매핑 1회차 — 호스트 8080 -> 컨테이너 80"
lognote "      (Phase 5 에서 이미 실행해 둔 컨테이너)"
logrun docker ps --filter name=web-8080 --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'

lognote "[2] 포트 매핑 2회차 — 같은 이미지를 호스트 8081 로 하나 더 실행"
lognote "      이미지는 하나지만 컨테이너는 여러 개 만들 수 있다. (붕어빵 틀 : 붕어빵)"
logrun docker run -d -p 8081:80 --name web-8081 my-web:1.0
sleep 3

lognote "[3] 두 컨테이너가 서로 다른 호스트 포트로 동시에 떠 있는지 확인"
logrun docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}'

lognote "[4] 접속 검증 — 8080 포트"
logrun curl -sS -i http://localhost:8080

lognote "[5] 접속 검증 — 8081 포트 (같은 이미지, 다른 포트로 동일하게 응답)"
logrun curl -sS -i http://localhost:8081

lognote "[6] 두 응답이 실제로 같은 내용인지 비교"
logsh 'curl -sS http://localhost:8080 | shasum -a 256'
logsh 'curl -sS http://localhost:8081 | shasum -a 256'

lognote "[7] === 포트 충돌 실험 === 이미 쓰고 있는 8080 을 또 요청하면?"
lognote "      호스트의 한 포트는 한 프로세스만 쓸 수 있으므로 실패해야 정상이다."
logrun docker run -d -p 8080:80 --name web-conflict my-web:1.0
logrun docker ps -a --filter name=web-conflict --format 'table {{.Names}}\t{{.Status}}'
lognote "      실패한 컨테이너 정리"
logrun docker rm -f web-conflict

lognote "[8] === EXPOSE 와 -p 의 차이 === 미션 목표 '포트 매핑이 필요한 이유' 근거"
lognote "      EXPOSE 는 이미지에 적힌 '문서'일 뿐 실제로 포트를 열어주지 않는다."
lognote "      -p 없이 실행하면 EXPOSE 80 이 있어도 호스트에서 접속할 수 없다."
logrun docker run -d --name web-noport my-web:1.0
sleep 2
logrun docker ps --filter name=web-noport --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'
lognote "      PORTS 칸에 '80/tcp' 만 있고, 앞에 '0.0.0.0:8082->' 같은 호스트 포트가 없다."
lognote "      즉 EXPOSE 선언만 표시될 뿐 호스트와 연결되지는 않았다. 접속을 시도해 보면:"
logrun curl -sS --max-time 5 http://localhost:8082
lognote "      >>> 결론: 컨테이너 안에서 nginx 는 잘 돌고 있지만(아래 확인),"
lognote "               -p 로 다리를 놓지 않으면 호스트에서는 닿을 수 없다."
logrun docker exec web-noport wget -q -O - http://127.0.0.1:80/env
logrun docker rm -f web-noport

lognote "[9] 최종 상태 — 포트 매핑된 컨테이너 2개가 정상 동작 중"
logrun docker ps --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}'

lognote "[완료] 포트 매핑 2회 검증 완료 (브라우저 접속 증거는 evidence/ 폴더 참고)"
