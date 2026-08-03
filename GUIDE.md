# 과제 가이드 — 개발 워크스테이션 구축 (터미널 / Docker / Git·GitHub)

> `mission.txt` 분석 기반 실행 가이드. 이 문서는 **작업 순서와 체크리스트**를 정리한 것이며,
> 실제 제출용 문서는 각 단계 수행 후 결과(README.md)에 별도로 작성해야 합니다.

---

## 0. 미션 한눈에 보기

| 항목 | 내용 |
|---|---|
| 목표 | 터미널·Docker·Git을 직접 세팅해보고, 재현 가능한 실행 환경을 구성 |
| 핵심 도구 | 리눅스 CLI, Docker(OrbStack), Git/GitHub |
| 산출물 | GitHub 공개 저장소 1개 (README.md에 모든 증거 링크/기록) |
| 환경(서울캠퍼스) | sudo 제한 → **OrbStack**으로 Docker 엔진 구동 (명령어는 `docker` 그대로 사용) |
| 필수 산출물 | 터미널 로그, Docker 점검/운영 로그, Dockerfile 커스텀 이미지, 포트 매핑 증거, 바인드마운트+볼륨 증거, Git/GitHub 연동 증거, 트러블슈팅 2건 이상 |
| 보너스(선택) | Compose 기초 → 멀티 컨테이너 → 운영 명령 → 환경변수 → GitHub SSH 키 |

---

## 1. 사전 준비

- [ ] macOS에 **OrbStack** 설치 (App Store 또는 https://orbstack.dev)
- [ ] OrbStack 실행 → 내부 Docker 엔진 자동 구동 확인
- [ ] 터미널에서 확인:
  ```bash
  docker --version
  docker info
  ```
- [ ] GitHub 계정 준비, 새 저장소 생성 (Public)
  ```bash
  mkdir -p ~/codyssey/dev-workstation
  cd ~/codyssey/dev-workstation
  git init
  git remote add origin <YOUR_REPO_URL>
  ```

---

## 2. 단계별 실행 체크리스트

### Step 1 — 터미널 기본 조작 (필수)
목적: 절대/상대 경로, 파일 조작 명령을 몸으로 익히기

- [ ] 현재 위치 확인: `pwd`
- [ ] 목록 확인(숨김 파일 포함): `ls -la`
- [ ] 디렉토리 이동: `cd`
- [ ] 디렉토리/파일 생성: `mkdir -p`, `touch`
- [ ] 복사: `cp`
- [ ] 이동/이름변경: `mv`
- [ ] 삭제: `rm`, `rm -r`
- [ ] 파일 내용 확인: `cat`, `less`
- [ ] 빈 파일 생성: `touch`

> **기록 방법**: 각 명령 실행 시 `$ 명령어` + 바로 아래 출력 결과를 코드블록으로 README에 붙여넣기.
> 절대경로(`/Users/...`) vs 상대경로(`../`, `./`) 차이를 실제 명령 예시로 1개씩 비교해서 설명 문단 추가.

### Step 2 — 파일 권한 실습 (필수, 최소 파일 1개 + 디렉토리 1개)
목적: r/w/x, 8진수 표기(755, 644) 이해

- [ ] 권한 확인: `ls -l`
- [ ] 파일 1개 권한 변경 전/후 비교: `chmod 644 <file>` → `ls -l` 캡처
- [ ] 디렉토리 1개 권한 변경 전/후 비교: `chmod 755 <dir>` → `ls -l` 캡처
- [ ] 소유자 확인(선택): `chown` (sudo 제한 환경이면 생략 가능, 대신 설명으로 대체)

> README에 "755 = rwxr-xr-x = 소유자 전체권한, 그룹/기타 읽기+실행" 식으로 표기 규칙 설명 문단 필요.

### Step 3 — Docker 설치 점검 (필수)
- [ ] `docker --version`
- [ ] `docker info` (데몬 동작 여부)
- [ ] `docker images` (이미지 목록)
- [ ] `docker ps`, `docker ps -a` (실행/전체 컨테이너)
- [ ] `docker logs <container>`
- [ ] `docker stats` (1회 스냅샷이라도 캡처)

### Step 4 — 컨테이너 실행 실습 (필수)
- [ ] `docker run hello-world` 성공 로그 기록
- [ ] `docker run -it ubuntu bash` → 내부에서 `ls`, `echo hello` 실행 후 `exit`
- [ ] attach(포그라운드 유지) vs exec(실행 중 컨테이너에 별도 진입)의 차이를 직접 관찰:
  ```bash
  docker run -d --name bgtest ubuntu sleep 100
  docker exec -it bgtest bash -lc "echo hi"
  docker attach bgtest   # 차이 관찰 후 정리
  ```
- [ ] 관찰 내용을 2~3문장으로 README에 요약

### Step 5 — 커스텀 이미지 제작 (필수, A 또는 B 택1)

**옵션 A: 웹서버 베이스 (nginx/apache) + 정적 콘텐츠 교체**
```dockerfile
FROM nginx:alpine
LABEL org.opencontainers.image.title="my-custom-nginx"
ENV APP_ENV=dev
COPY site/ /usr/share/nginx/html/
```

**옵션 B: Linux 베이스 (ubuntu/alpine) + 패키지/사용자/환경변수/헬스체크 추가**
```dockerfile
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
ENV APP_ENV=dev
RUN useradd -m appuser
USER appuser
HEALTHCHECK CMD curl -f http://localhost:5000/ || exit 1
```

- [ ] Dockerfile 작성 (`app/` 또는 `src/` 폴더에 웹서버 소스 포함)
- [ ] 빌드: `docker build -t my-web:1.0 .`
- [ ] 실행: `docker run -d -p 8080:80 --name my-web-8080 my-web:1.0`
- [ ] 접속 확인: `curl http://localhost:8080` 또는 브라우저 접속 스크린샷(**주소창 포함**)
- [ ] README에 "선택한 베이스 / 커스텀 포인트별 목적" 표로 정리

### Step 6 — 포트 매핑 재검증 (필수, 2회 이상)
- [ ] 서로 다른 host port로 2회 실행하여 각각 접속 성공 증거 수집
  ```bash
  docker run -d -p 8080:80 --name web1 my-web:1.0
  docker run -d -p 8081:80 --name web2 my-web:1.0
  curl http://localhost:8080
  curl http://localhost:8081
  ```

### Step 7 — 바인드 마운트 (필수)
목적: 호스트 변경 → 컨테이너 즉시 반영 확인

```bash
mkdir -p ~/codyssey/dev-workstation/site
echo "<h1>v1</h1>" > site/index.html
docker run -d -p 8082:80 -v $(pwd)/site:/usr/share/nginx/html --name bindtest nginx:alpine
curl http://localhost:8082
echo "<h1>v2 - updated</h1>" > site/index.html
curl http://localhost:8082    # 변경 즉시 반영 확인
```
- [ ] 변경 전/후 curl 결과 or 스크린샷 비교

### Step 8 — Docker 볼륨 영속성 (필수)
```bash
docker volume create mydata
docker run -d --name vol-test -v mydata:/data ubuntu sleep infinity
docker exec -it vol-test bash -lc "echo hi > /data/hello.txt && cat /data/hello.txt"
docker rm -f vol-test
docker run -d --name vol-test2 -v mydata:/data ubuntu sleep infinity
docker exec -it vol-test2 bash -lc "cat /data/hello.txt"   # 컨테이너 삭제 후에도 데이터 유지 확인
```
- [ ] 삭제 전/후 데이터 유지 증거 캡처

### Step 9 — Git 설정 및 GitHub/VSCode 연동 (필수)
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --list
```
- [ ] VSCode에서 GitHub 로그인 → 저장소 연동 스크린샷
- [ ] `git add`, `git commit`, `git push`로 최초 커밋 업로드
- [ ] ⚠️ 토큰/비밀번호/개인키가 스크린샷·로그에 노출되지 않도록 마스킹

### Step 10 — 트러블슈팅 기록 (필수, 2건 이상)
포맷: **문제 → 원인 가설 → 확인 방법 → 해결/대안**

예시:
> **문제**: `docker: permission denied` 발생
> **원인 가설**: sudo 권한 제한 환경에서 Docker 데몬 접근 문제로 추정
> **확인**: OrbStack 실행 여부 및 `docker context ls` 확인
> **해결**: OrbStack 앱 실행 후 재시도 → 정상 동작

실습 중 실제로 겪은 이슈 2개 이상을 이 형식으로 README에 기록.

---

## 3. 보너스 과제 (선택, 여유 있으면 진행)

### B1. Docker Compose 기초
```yaml
# docker-compose.yml
services:
  web:
    build: .
    ports:
      - "8080:80"
```
- [ ] `docker compose up -d` / `docker compose down` 실행 성공
- [ ] 배움 포인트 한 줄 요약: "실행 명령 → 문서화된 설정 파일로 전환되는 이유"

### B2. Docker Compose 멀티 컨테이너
```yaml
services:
  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - redis
  redis:
    image: redis:alpine
```
- [ ] 두 서비스 동시 실행, 컨테이너 간 통신 확인:
  ```bash
  docker compose exec web ping redis
  ```
- [ ] 서비스명으로 서로를 찾는 것(서비스 디스커버리) 관찰 기록

### B3. Compose 운영 명령어
- [ ] `docker compose up -d`, `docker compose ps`, `docker compose logs`, `docker compose down` 각각 실행 결과 기록

### B4. 환경 변수 활용
```yaml
services:
  web:
    build: .
    environment:
      - PORT=3000
    ports:
      - "3000:3000"
```
- [ ] Dockerfile 또는 Compose에서 `ENV`/`environment`로 포트·모드 변경 후 재실행 확인
- [ ] "설정과 코드의 분리"를 어떻게 체감했는지 한 줄 정리

### B5. GitHub SSH 키 설정
```bash
ssh-keygen -t ed25519 -C "you@example.com"
cat ~/.ssh/id_ed25519.pub   # GitHub Settings > SSH Keys에 등록
ssh -T git@github.com       # 연결 확인
git remote set-url origin git@github.com:<user>/<repo>.git
git push
```
- [ ] SSH push 성공 로그 (키 내용 자체는 노출 금지, 공개키 지문 정도만 캡처)

---

## 4. README.md 템플릿 (그대로 복사해서 채우기)

```markdown
# 개발 워크스테이션 구축

## 1) 프로젝트 개요
- 미션 목표 요약 (2~3문장)

## 2) 실행 환경
- OS: macOS (버전)
- Shell: zsh
- Docker: (docker --version 결과)
- Git: (git --version 결과)
- 컨테이너 런타임: OrbStack

## 3) 수행 체크리스트
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습 (파일 1 / 디렉토리 1)
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] ubuntu 컨테이너 진입 실습
- [x] Dockerfile 기반 커스텀 이미지 빌드/실행
- [x] 포트 매핑 접속 (2회 이상)
- [x] 바인드 마운트 반영 확인
- [x] 볼륨 영속성 검증
- [x] Git 설정 + VSCode GitHub 연동
- [ ] (보너스) Compose 단일 서비스
- [ ] (보너스) Compose 멀티 컨테이너
- [ ] (보너스) Compose 운영 명령어
- [ ] (보너스) 환경 변수 활용
- [x] (보너스) GitHub SSH 키 설정 → README 19장

## 4) 검증 방법 및 결과 링크
| 항목 | 검증 명령 | 결과 위치 |
|---|---|---|
| Docker 설치 | docker --version, docker info | (스크린샷/로그 링크) |
| 포트 매핑 | curl http://localhost:8080 | (스크린샷 링크) |
| 볼륨 영속성 | docker exec ... cat /data/hello.txt | (스크린샷 링크) |

## 5) 터미널 조작 로그 (발췌)
\`\`\`bash
$ pwd
...
\`\`\`

## 6) Docker 운영 로그
\`\`\`bash
$ docker images
...
\`\`\`

## 7) 커스텀 이미지
- 선택한 베이스: (nginx:alpine 등)
- 커스텀 포인트: (목적 요약)
\`\`\`dockerfile
(Dockerfile 전체)
\`\`\`

## 8) 포트 매핑 접속 증거
(스크린샷: 주소창 + 응답 화면)

## 9) 바인드 마운트 / 볼륨 영속성 증거
(변경 전/후 비교)

## 10) Git/GitHub 연동 증거
(git config --list 결과, VSCode 연동 스크린샷)

## 11) 트러블슈팅
### 이슈 1
- 문제:
- 원인 가설:
- 확인:
- 해결/대안:

### 이슈 2
- 문제:
- 원인 가설:
- 확인:
- 해결/대안:

## 12) 보너스 과제 결과 (해당 시)
...
```

---

## 5. 제출 전 최종 점검

- [ ] README만 읽어도 전체 수행 내용 파악 가능한가?
- [ ] 모든 코드/명령/출력이 코드블록으로 정리되어 있는가?
- [ ] 브라우저 접속 스크린샷에 주소창(포트 포함)이 보이는가?
- [ ] 토큰/비밀번호/개인키 등 민감정보가 전혀 노출되지 않았는가?
- [ ] 트러블슈팅 2건 이상 기록했는가?
- [ ] 저장소가 Public이고 링크로 전체 확인 가능한가?
- [ ] 특정 개인 PC 경로에 의존하는 부분이 있다면 대체 방법을 적었는가?
