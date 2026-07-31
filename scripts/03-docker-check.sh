#!/usr/bin/env bash
# =============================================================================
#  Phase 3 — Docker 설치 점검 및 이미지 다운로드
#  미션 4장 요구:
#    - Docker 버전 확인 (docker --version)
#    - Docker 데몬 동작 여부 확인 (docker info 또는 동등 점검)
#    - 이미지: 다운로드 / 목록 확인
# =============================================================================
set -u
cd "$(dirname "$0")/.."

export LOGFILE="logs/03-docker-check.log"
rm -f "$LOGFILE"
# shellcheck source=scripts/runlog.sh
source scripts/runlog.sh

lognote "[1] Docker 버전 확인 — 클라이언트가 설치되어 있는가"
logrun docker --version

lognote "[2] Docker 데몬 동작 여부 확인 — docker info"
lognote "      Server 섹션이 에러 없이 출력되면 데몬이 살아있다는 뜻이다."
lognote "      데몬이 죽어 있으면 'Cannot connect to the Docker daemon' 이 뜬다."
logrun docker info

lognote "[3] 컨테이너 런타임 확인 — 어떤 엔진으로 도커가 도는가"
lognote "      서울캠퍼스 환경은 sudo 제한 때문에 Docker Desktop 대신 OrbStack 을 사용한다."
lognote "      아래 * 표시가 현재 활성 컨텍스트다."
logrun docker context ls

lognote "[4] Docker Compose 플러그인 확인 (보너스 과제 대비)"
logrun docker compose version

lognote "[5] 이미지 다운로드 — docker pull"
lognote "      docker run 을 하면 이미지가 자동으로 받아지지만,"
lognote "      '다운로드' 과정을 증거로 남기기 위해 pull 을 따로 실행한다."

lognote "[5-1] hello-world — Docker 설치 확인용 최소 이미지"
logrun docker pull hello-world

lognote "[5-2] ubuntu:24.04 — 리눅스 실습용 이미지"
logrun docker pull ubuntu:24.04

lognote "[5-3] nginx:1.29-alpine — 커스텀 이미지의 베이스가 될 웹서버 이미지"
logrun docker pull nginx:1.29-alpine

lognote "[6] 다운로드된 이미지 목록 확인 — docker images"
logrun docker images

lognote "[완료] Docker 점검 및 이미지 준비 종료"
