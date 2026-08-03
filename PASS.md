# 평가문항 18개 — 답변 + 증빙

> **각 문항 구성**
>
> | 칸 | 쓰임 |
> |---|---|
> | **🔍 이 질문이 확인하려는 것** | 평가자가 왜 묻는지. **여기에 맞춰 답하면 벗어나지 않음** |
> | **① 답** | 결론 한 줄. 먼저 이것만 말한다 |
> | **② 이렇게 했습니다** | 뭘 했는지 / 왜 그렇게 판단했는지 |
> | **③ 증빙** | ▶ 링크를 `Cmd`+클릭 → GitHub이 열리고 해당 줄이 노란색 |
> | **💡 물어보면** | 용어를 되물었을 때 답할 것 |

| 항목 | 문항 |
|---|---|
| 1. 기능 동작 검증 | 1 ~ 9번 |
| 2. 동작 구조 설계 | 10 ~ 11번 |
| 3. 핵심 기술 원리 | 12 ~ 15번 |
| 4. 심층 인터뷰 | 16 ~ 18번 |
| 5. 보너스 | SSH 키 1개 수행 |

---

# 1번. 터미널에서 기본 명령어로 폴더/파일 생성·이동·삭제를 수행한 흔적이 있는가?

**🔍 이 질문이 확인하려는 것**
> **터미널 기본 명령을 쓸 줄 아는가.**
> 미션이 요구한 것 — 위치 확인 · 목록(숨김 포함) · 이동 · 생성 · 복사 · 이동/이름변경 · 삭제 · 내용 확인 · 빈 파일 생성

**① 네, 아홉 가지 전부 수행했습니다.**

**② 쓴 명령**

| 명령 | 원말 | 뜻 |
|---|---|---|
| `pwd` | **P**rint **W**orking **D**irectory | 지금 어느 폴더인지 |
| `ls -la` | **l**i**s**t / **l**ong · **a**ll | 목록 (자세히 · 숨김까지) |
| `cd` | **C**hange **D**irectory | 폴더 이동 |
| `mkdir` | **M**a**k**e **Dir**ectory | **폴더 생성** |
| `touch` | touch | **빈 파일 생성** |
| `cp` | **c**o**p**y | 복사 |
| `mv` | **m**o**v**e | **이동 / 이름 변경** |
| `rm` | **r**e**m**ove | **삭제** |
| `cat` | con**cat**enate | 내용 확인 |

> **`mv` 는 한 명령인데 결과가 둘입니다.** 같은 폴더로 보내면 **이름 변경**, 다른 폴더로 보내면 **이동**.
> 그래서 **두 경우를 각각 실행해서** 나눠 기록했습니다.

**③ 증빙**

**▶ [README 6-1절 · 위치 확인과 목록](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L155-L180)**
```
$ pwd
/Users/ellysuh/Documents/1-homework

$ ls -la
-rw-r--r--@  1 ellysuh  staff   1207 Jul 31 20:26 .dockerignore
drwxr-xr-x@  9 ellysuh  staff    288 Jul 31 20:10 .git
```
🗣️ **"`-a` 를 빼면 점으로 시작하는 `.git` 같은 숨김 파일이 안 보입니다."**

**▶ [README 6-2절 · 생성과 내용 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L181-L197)**
```
$ mkdir -p practice/docs practice/backup      # 폴더 생성
$ touch practice/empty-note.txt               # 빈 파일 생성
-rw-r--r--@ 1 ellysuh  staff  0 ...           # ← 크기가 0바이트
$ cat practice/hello.txt                      # 내용 확인
```
🗣️ **"`touch` 로 만든 거라 크기가 0바이트입니다. 이게 빈 파일 생성 증거입니다."**

**▶ [README 6-3절 · 복사 · 이름변경 · 이동 · 삭제](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L198-L218)** ⭐
```
$ cp practice/hello.txt practice/backup/hello-copy.txt   # 복사
$ mv .../hello-copy.txt .../hello-renamed.txt   # 같은 폴더 → 이름변경
$ mv practice/empty-note.txt practice/docs/     # 다른 폴더 → 이동
$ rm practice/backup/hello-renamed.txt          # 파일 삭제
$ rm -r practice/backup                         # 폴더째 삭제
```
🗣️ **"`mv` 가 두 번 나오는데 주석이 다릅니다. 이름 변경과 이동을 나눠 실행한 겁니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `cd ..` 는? | `..` = **한 칸 위 폴더**. `.` 은 지금 폴더 |
| `-r` 은? | **r**ecursive — 폴더 안까지 통째로 |
| `rm` 은 왜 remove? | 휴지통이 없어서 **복구 불가**. 그래서 delete가 아님 |
| `cat` 이 왜 내용 보기? | 원래 파일을 **이어 붙여** 출력하는 명령. 하나만 주면 그 파일만 나옴 |
| `staff` 는? | 맥의 **기본 그룹 이름**. 권한 가운데 자리가 이 그룹에 적용됨 |

📄 원본: [`logs/01-terminal.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/01-terminal.log)

---

# 2번. 파일 권한 변경 결과가 확인되는가?

**🔍 이 질문이 확인하려는 것**
> **권한을 바꿀 줄 알고, 바뀐 걸 증명할 줄 아는가.**
> 미션 요구 — **파일 1개 + 디렉토리 1개**, **변경 전/후 비교**
> → 그래서 **파일·폴더 각각 × 전·후 각각** 이 필요합니다.

**① 네, 확인됩니다.**

**② 숫자의 뜻**

세 자리는 **소유자 · 그룹 · 나머지** 순서. 각 자리는 **읽기 4 + 쓰기 2 + 실행 1** 을 더한 값입니다.

| | 소유자 | 그룹 | 나머지 | 뜻 |
|---|---|---|---|---|
| **644 → 600** | 6 (읽기+쓰기) | 4 → **0** | 4 → **0** | 남들이 못 보게 |
| **755 → 700** | 7 (전부) | 5 → **0** | 5 → **0** | 남들이 못 들어오게 |

> **남들 권한을 0으로 만든 것**입니다.

**③ 이렇게 판단했습니다**
> `ls -l` 글자가 바뀐 것만 보여주면 **표시만 바뀐 건지 진짜 막히는 건지 알 수 없습니다.**
> 그래서 `chmod 000` 으로 잠그고 **직접 열어봤습니다.**

**④ 증빙 — 파일·폴더 × 전·후, 4개**

**▶ [README 7-1절 · 바꾸기 전](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L262-L267)**
```
### === 변경 전 ===
-rw-r--r--@ ... perm-test.txt        # 644   ← 파일
drwxr-xr-x@ ... perm-demo            # 755   ← 폴더
```
🗣️ **"파일 하나, 폴더 하나. 원래 상태입니다."**

**▶ [README 7-1절 · 바꾼 후](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L269-L277)**
```
$ chmod 600 practice/perm-test.txt
-rw-------@ ... perm-test.txt        # ← 뒤 6글자가 잠김

$ chmod 700 practice/perm-demo
drwx------@ ... perm-demo            # ← 진입 권한 회수
```
🗣️ **"둘 다 뒤 여섯 글자가 `------` 로 바뀌었습니다."**

**▶ [README 7-2절 · 파일이 진짜 막히나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L293-L295)** ⭐
```
$ cat practice/perm-test.txt
Permission denied              # ← 소유자인데도 막힌다
```
🗣️ **"`chmod 000` 으로 잠그고 열어본 겁니다. 제 파일인데도 막혔습니다."**

**▶ [README 7-2절 · 폴더가 진짜 막히나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310)** ⭐
```
$ chmod 644 practice/perm-demo      # 폴더에서 x 제거
$ ls practice/perm-demo
ls: fts_read: Permission denied     # ← 폴더에 들어갈 수 없다
```
🗣️ **"폴더는 `x` 를 빼니까 못 들어갑니다. 폴더의 `x` 는 '들어가기' 권한이라서요."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `chmod` 는? | **Ch**ange **Mod**e — 권한 바꿔라 |
| `ls -l` 은 왜? | `-l` 을 붙여야 **권한이 보임**. 안 붙이면 이름만 나옴 |
| `x` 는? | e**x**ecute. **파일은 실행**, **폴더는 들어가기** |
| 왜 `000` 까지? | `600` 은 내가 읽을 수 있어서 **막히는 장면을 못 만듦** |
| `cat` 을 왜 씀? | 내용이 궁금해서가 아니라 **문을 열어보려고**. 막히면 `Permission denied` |

📄 원본: [`logs/02-permissions.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/02-permissions.log)

---

# 3번. `docker --version` 이 출력되고, Docker가 동작 가능한 상태인가?

**🔍 이 질문이 확인하려는 것**
> 질문이 **두 개**입니다.
> ① 버전이 나오는가 (**설치됐나**)
> ② **동작 가능한 상태인가** (**엔진이 살아있나**)
> → **①만 답하면 절반만 답한 것**입니다.

**① 네, 둘 다 확인했습니다. 버전은 29.4.0 입니다.**

**② 왜 `docker info` 까지 했냐면**
> `--version` 은 **명령을 받는 클라이언트가 깔려 있다**는 뜻일 뿐입니다.
> 실제로 컨테이너를 만들고 돌리는 건 **데몬(엔진)** 이라서, **엔진이 꺼져 있어도 버전은 나옵니다.**
> 그래서 `docker info` 로 **Server 섹션이 뜨는지**까지 확인했습니다.

**③ 증빙**

**▶ [README 8-1절 · 버전 + 데몬 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L324-L344)** ⭐
```
$ docker --version
Docker version 29.4.0, build 9d7ad9f

$ docker info
Server:                    # ← Server 섹션이 뜨면 데몬이 살아있다는 뜻
 Server Version: 29.4.0
```
🗣️ **"이 `Server:` 한 줄이 핵심입니다. 엔진이 꺼져 있으면 여기에 `Cannot connect to the Docker daemon` 이 뜹니다."**

**▶ [README 2장 · OrbStack을 쓰는 이유](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L32-L45)**
```
orbstack *   OrbStack   unix:///Users/ellysuh/.orbstack/run/docker.sock
```
🗣️ **"맥은 리눅스 커널이 없어서 도커를 그냥 못 돌립니다. `sudo` 도 막혀 있어서 OrbStack으로 우회했고, 명령어는 똑같습니다. 별표가 지금 쓰는 엔진이에요."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 클라이언트 / 데몬? | **클라이언트** = 내가 치는 `docker` 명령 / **데몬** = 실제로 컨테이너를 돌리는 엔진 |
| OrbStack 이 뭐죠? | Docker Desktop 같은 도구인데 **관리자 권한 없이** 엔진을 돌려줌 |

📄 원본: [`logs/03-docker-check.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/03-docker-check.log)

---

# 4번. `docker run hello-world` 가 정상 실행되는가?

**🔍 이 질문이 확인하려는 것**
> **컨테이너를 실제로 띄울 수 있는가.** 설치 확인의 마지막 단계입니다.

**① 네, `Hello from Docker!` 가 정상 출력됐습니다.**

**② 이 이미지가 하는 일**
> 메시지 하나 뿌리고 바로 끝나는 **설치 확인용 이미지**입니다.
> 출력 안에 **도커 동작 순서 1~4번**이 같이 나와서, 그것도 통째로 남겼습니다.

**③ 증빙**

**▶ [README 9-1절 · hello-world](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L403-L420)**
```
Hello from Docker!
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image
 3. The Docker daemon created a new container
 4. The Docker daemon streamed that output to the client
```
🗣️ **"이 1~4번이 도커 동작 순서입니다. 클라이언트가 데몬에 요청 → 이미지 받아옴 → 컨테이너 생성 → 결과 전달."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 끝났는데 어디 갔나요? | 꺼진 것뿐. **`docker ps -a` 에 기록이 남습니다** |
| `-d` 는 왜 안 붙였나요? | 한 번 출력하고 끝나는 거라 **백그라운드로 돌릴 이유가 없어서** |

📄 원본: [`logs/04-container-basics.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log)

---

# 5번. 이미지/컨테이너 목록 확인 및 정리 흔적이 있는가?

**🔍 이 질문이 확인하려는 것**
> **도커 기본 운영 명령을 쓸 줄 아는가.**
> ① 이미지와 컨테이너를 **구분**해서 목록을 볼 줄 아는가
> ② 실행 중인 것과 끝난 것을 **구분**할 줄 아는가
> ③ 다 쓴 컨테이너를 **정리**할 줄 아는가

**📖 먼저 용어를 정의하고 시작합니다 — 붕어빵 틀과 붕어빵**

🗣️ **"목록 확인을 말씀드리기 전에, 이미지와 컨테이너가 뭔지부터 정리하겠습니다. 이 둘이 달라서 보는 명령도 따로 있거든요."**

| | 이미지 (틀) | 컨테이너 (붕어빵) |
|---|---|---|
| **정의** | 실행에 필요한 걸 **전부 담아 굳혀놓은 파일** (프로그램·설정·라이브러리) | 그 이미지를 **실제로 띄워서 돌아가고 있는 것** |
| **상태** | **안 바뀜** (읽기 전용) | 돌거나 · 꺼지거나 · 지워짐 |
| **개수** | 1개 | 그 1개로 **여러 개** 찍을 수 있음 |
| **만드는 법** | `docker build` | `docker run` |
| **보는 법** | `docker images` | `docker ps` / `ps -a` |

🗣️ **"틀은 하나인데 붕어빵은 여러 개 구울 수 있죠. 그래서 `docker images` 는 틀 목록, `docker ps` 는 붕어빵 목록입니다."**

> 더 깊게 물으면 → **12번**에서 빌드·실행·변경 세 관점으로 정리해뒀습니다.

---

**① 네, 있습니다. 방금 나눈 그 기준대로 이미지와 컨테이너를 따로 확인했습니다.**

**② 쓴 명령**

| | 목록 확인 | 정리 |
|---|---|---|
| **이미지** | `docker images` | 실습에 계속 쓰므로 유지 |
| **컨테이너** | `docker ps` (돌아가는 것)<br>`docker ps -a` (끝난 것까지) | `docker stop` → `docker rm` |

## 이미지 — 목록 확인

**▶ [README 8-2절 · 다운로드와 목록](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L345-L370)**
```
$ docker pull hello-world
Status: Downloaded newer image for hello-world:latest

$ docker images
hello-world:latest   c3cbe1cc1aa5    18.5kB
my-web:1.0           7110d4e5fcaa    93.1MB      ← 제가 만든 이미지
nginx:1.29-alpine    5616878291a2      94MB
ubuntu:24.04         4fbb8e6a8395     139MB
```
🗣️ **"`pull` 로 세 개를 받고 목록으로 확인했습니다. `my-web:1.0` 은 받은 게 아니라 제가 Dockerfile로 만든 겁니다."**

> **`pull` 을 따로 친 이유** — `run` 만 쳐도 이미지는 자동으로 받아집니다. 그런데 **이미 받아놨으면 다운로드 줄이 아예 안 나옵니다.** 언제 치느냐에 따라 로그가 달라져서, `pull` 을 분리해 **항상 같은 모양으로** 남겼습니다.

## 컨테이너 — 목록 확인 + 정리

**▶ [README 8-3절 · 목록 · 운영 · 정리](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L371-L398)**
```
$ docker ps                        # 돌아가는 것만
$ docker ps -a                     # 끝난 것까지 전체

$ docker logs --tail 5 tick-demo   # 로그 확인
$ docker stats --no-stream         # 자원 확인

$ docker stop tick-demo            # 중지
tick-demo   Exited (137)           # ← 꺼짐
```
🗣️ **"`ps` 는 돌아가는 것만, `ps -a` 는 끝난 것까지 나옵니다. 마지막 `Exited` 가 중지했다는 증거입니다."**

**▶ [로그 원본 · 컨테이너 삭제](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log)**
```
### [4-6] 컨테이너 삭제 — docker rm (실습 정리)
$ docker rm tick-demo hello-test
```
🗣️ **"중지만 하면 목록에 남아 있어서, `rm` 으로 지우는 것까지 했습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `tick-demo` 가 뭐죠? | **1초마다 숫자를 세는 컨테이너.** 로그·자원·중지를 실습하려고 띄운 것 |
| `--no-stream` 은? | `stats` 는 화면이 **계속 갱신돼서 파일로 저장이 안 됨.** 이걸 붙이면 한 장면만 찍고 끝 |
| `--tail 5` 는? | **끝에서 5줄만.** 안 붙이면 수백 줄이 다 나옴 |
| `Exited (137)` 은? | **128 + 9** = 강제 종료로 죽음 |
| `ps` 는? | **P**rocess **S**tatus (프로세스 상태) |
| 이미지는 왜 안 지웠나요? | **실습에 계속 써야 해서.** 지우려면 `docker rmi` |

📄 원본: [`logs/03-docker-check.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/03-docker-check.log), [`logs/04-container-basics.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log)

---

# 6번. Dockerfile로 이미지 빌드가 가능한가?

**🔍 이 질문이 확인하려는 것**
> **Dockerfile을 직접 써서 이미지를 만들 수 있는가.**
> 미션 요구 — ① 어떤 베이스를 골랐는지 ② **내가 얹은 커스텀 포인트의 목적** ③ 빌드/실행 결과
> → **"만들었다"** 만이 아니라 **"왜 이렇게 만들었나"** 를 묻습니다.

**① 네, `nginx` 를 베이스로 `my-web:1.0` 을 만들었고 실행까지 성공했습니다.**

**② 베이스 선택과 커스텀 포인트**

`nginx:1.29-alpine` 을 골랐습니다. **웹서버가 이미 들어있어서** 포트 매핑·마운트 검증이 바로 되고, **버전을 고정**해야 나중에 빌드해도 같은 결과가 나옵니다.

| 지시어 | 얹은 것 | 목적 |
|---|---|---|
| `LABEL` | 이름·설명·버전 | 이미지가 쌓여도 출처 추적 |
| `ARG`/`ENV` | `APP_PORT`, `APP_ENV` | **설정을 코드에서 분리** |
| `COPY app/` | 내가 만든 웹페이지 | **정적 콘텐츠 교체** (미션 요구) |
| `COPY templates/` | 서버 설정 | **설정 교체** (미션 요구) |
| `EXPOSE` | 쓰는 포트 선언 | 문서화 |
| `HEALTHCHECK` | 10초마다 자가진단 | "떠 있는 것"과 "정상인 것"은 다름 |

**③ 이렇게 판단했습니다**
> **"빌드 성공" 글자만으로는 제가 넣은 게 진짜 들어갔는지 알 수 없습니다.**
> 그래서 `docker inspect` 로 하나씩 다시 꺼내 확인하고, **헬스체크가 `starting` → `healthy` 로 바뀌는 것**까지 남겼습니다.

**④ 증빙**

**▶ [README 10-3절 · Dockerfile 전문](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L529-L563)**
```dockerfile
FROM nginx:1.29-alpine
# [커스텀 ①] 이미지 메타데이터      LABEL
# [커스텀 ②] 설정값을 코드에서 분리  ARG / ENV
# [커스텀 ③] 정적 콘텐츠 교체       COPY app/
# [커스텀 ④] 서버 설정 교체         COPY templates/
# [커스텀 ⑤] 사용 포트 선언         EXPOSE
# [커스텀 ⑥] 헬스체크              HEALTHCHECK
```
🗣️ **"완성된 nginx 틀을 `FROM` 으로 가져와서 제 걸 여섯 가지 얹었습니다."**

**▶ [README 10-4절 · 빌드 성공](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L564-L582)**
```
$ docker build --progress=plain -t my-web:1.0 .
#8 naming to docker.io/library/my-web:1.0 done
```
🗣️ **"이 마지막 줄이 이미지가 완성된 줄입니다."**

**▶ [README 10-5절 · 헬스체크가 진짜 도나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L603-L612)** ⭐
```
Health: starting
# 10초 뒤
Health: healthy

Up 12 seconds (healthy)   0.0.0.0:8080->80/tcp
```
🗣️ **"제가 넣은 헬스체크가 실제로 작동해서 `healthy` 로 바뀐 겁니다."**

**▶ [README 10-5절 · 설정이 채워졌나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L617-L625)**
```
    listen       80;                     # ← ${APP_PORT} 가 치환됨
    add_header X-App-Env  "dev"  always; # ← ${APP_ENV} 가 치환됨
```
🗣️ **"설정을 빈칸으로 넣어뒀는데 실행할 때 실제 값으로 채워졌습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| Dockerfile 이 뭐죠? | **이미지를 만드는 순서를 적어둔 레시피 파일** |
| 왜 Dockerfile로 만드나요? | 손으로 만들면 **뭘 했는지 남지 않고 재현이 안 됨** |
| `FROM` 은? | **어느 이미지에서 시작할지.** 처음부터 다 만들 필요가 없음 |
| `-t` 는? | **t**ag — 이미지 이름표 (`my-web:1.0`) |
| `my-web:1.0` 의 `1.0` 은? | **버전(태그).** 안 붙이면 `latest` 가 자동으로 붙음 |
| `--progress=plain` 은? | 기본 모드는 애니메이션이라 **파일에 깨진 기호만 남아서** |

📄 [`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) · [`logs/05-image-build.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/05-image-build.log)

---

# 7번. 매핑된 포트로 접속이 가능한가?

**🔍 이 질문이 확인하려는 것**
> **포트 매핑을 직접 설정하고 접속을 검증했는가.**
> 미션 제약 — 증거는 **주소창(포트 포함)과 응답 화면이 함께** 보여야 함
> → 로그만으로는 부족하고 **브라우저 캡처**가 필요합니다.

**📖 먼저 왜 포트 매핑이 필요한지부터 — 강 건너 섬입니다**

🗣️ **"접속 결과를 보여드리기 전에, 왜 이 작업이 필요한지부터 말씀드리겠습니다."**

> 컨테이너는 **격리된 공간**입니다. **강 건너 섬**이라고 보시면 돼요.
> 섬에도 80번 건물이 있고 제 컴퓨터에도 80번 건물이 있는데 **완전히 다른 건물**입니다.
> 그래서 **다리를 놓지 않으면 밖에서 섬에 닿을 수가 없습니다.** `-p` 가 그 다리입니다.

```
docker run -p 8080:80
              ─┬─ ─┬
               │   └ 컨테이너 안쪽 문 (섬)
               └──── 내 컴퓨터 쪽 문 (뭍)
```

| | 뜻 |
|---|---|
| **왼쪽 8080** | 내 컴퓨터(호스트) 포트 — **브라우저에 치는 번호**. 겹치면 충돌 |
| **오른쪽 80** | 컨테이너 안 nginx가 듣고 있는 포트 — 격리돼 있어 **여러 컨테이너가 다 80을 써도 무방** |

⚠️ **자주 헷갈리는 것**
> `EXPOSE` 는 다리가 **아닙니다.** "이 포트 씁니다" 라고 적어둔 **문서일 뿐**이고, 실제로 여는 건 `-p` 뿐입니다.

> 이걸 **직접 증명한 실험**이 있습니다 → **13번** (`-p` 없이 띄우면 밖에선 실패, 안에선 성공)

---

**① 네, 8080과 8081 두 포트 모두 접속됩니다.**

**② 이렇게 했습니다**
> **같은 이미지 하나**로 컨테이너 두 개를 서로 다른 포트에 띄웠습니다.
> 확인은 **`curl` 응답 → 두 응답 대조 → 브라우저 캡처** 순으로 했습니다.

**③ 증빙**

**▶ [README 11-1절 · 이미지 1개, 컨테이너 2개](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655)**
```
$ docker run -d -p 8080:80 --name web-8080 my-web:1.0
$ docker run -d -p 8081:80 --name web-8081 my-web:1.0

web-8081   0.0.0.0:8081->80/tcp   Up 5 seconds (healthy)
web-8080   0.0.0.0:8080->80/tcp   Up About a minute (healthy)
```
🗣️ **"이미지는 `my-web:1.0` 하나인데 컨테이너가 둘입니다. 왼쪽 포트만 다르고 오른쪽 80은 둘 다 같습니다."**

**▶ [README 11-2절 · curl 응답](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L656-L682)**
```
$ curl -i http://localhost:8080
HTTP/1.1 200 OK
```
🗣️ **"`200 OK` 는 정상 응답이라는 뜻입니다. 8081도 같습니다."**

**▶ [README 11-3절 · 브라우저 접속 화면](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696)** ⭐
🗣️ **"스크린샷이 바로 뜹니다. 주소창에 `localhost:8080` 이 보이고, 8081과 환경변수 확인 화면도 있습니다."**

**▶ [README 11-4절 · 포트 충돌 실험](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L697-L708)**
```
Bind for 0.0.0.0:8080 failed: port is already allocated
```
🗣️ **"일부러 8080을 겹쳐 써본 겁니다. 호스트 포트는 하나만 쓸 수 있습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `-p 8080:80` 은? | **내 컴퓨터 8080 → 컨테이너 80** 으로 연결 |
| `-d` 는? | **d**etached — 백그라운드로. 터미널을 안 붙잡음 |
| `Up 5 seconds` 는? | **살아있고 켠 지 5초** 됐다는 뜻 |
| `curl` 은? | **터미널로 웹사이트 접속**하는 도구. 결과가 글자라 로그로 남음 |
| `-i` 는? | 응답 헤더까지 보여줘 → `200 OK` 확인용 |
| 왜 두 개를 띄웠나요? | **이미지 하나로 여러 개 만들 수 있다**는 걸 보이려고 |

📄 [`evidence/browser-8080.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/browser-8080.png) · [`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

---

# 8번. Docker 볼륨 데이터가 컨테이너 삭제 후에도 유지되는가?

**🔍 이 질문이 확인하려는 것**
> **볼륨의 영속성을 증명할 수 있는가.**
> 미션 요구 — 생성/연결/검증 절차 + **컨테이너 삭제 전/후 비교**
> → **"삭제했다"** 와 **"그래도 남아있다"** 가 둘 다 보여야 합니다.

**① 네, 유지됩니다. 컨테이너를 완전히 지웠는데 기록 시각까지 그대로 나왔습니다.**

**② 이렇게 판단했습니다**
> 볼륨 실험만 보여드리면 **"원래 안 지워지는 것 아니냐"** 는 의문이 남습니다.
> 그래서 **볼륨을 안 쓴 대조군**으로 똑같은 절차를 한 번 더 했습니다.
> **두 실험의 차이는 볼륨 연결 여부 하나뿐**이라, 볼륨이 원인이라는 게 성립합니다.

**③ 증빙 — 삭제 전 · 삭제 · 삭제 후 · 대조군**

**▶ [README 13-1절 · 삭제 전](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L786-L794)**
```
$ docker exec vol-test cat /data/hello.txt
기록 시각: 2026-07-31 11:42:47
```
🗣️ **"지우기 전 내용입니다. 시각을 기억해 두세요."**

**▶ [README 13-1절 · 컨테이너 삭제](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L796-L805)**
```
$ docker rm -f vol-test          ← 컨테이너 완전 삭제
$ docker volume ls
local     my-data                ← 볼륨은 그대로 남아있다
```
🗣️ **"컨테이너는 사라졌는데 볼륨은 남아 있습니다."**

**▶ [README 13-1절 · 삭제 후 새 컨테이너에서 읽기](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L807-L812)** ⭐
```
$ docker run -d --name vol-test2 -v my-data:/data ubuntu:24.04 sleep infinity
$ docker exec vol-test2 cat /data/hello.txt
기록 시각: 2026-07-31 11:42:47      ← 그대로 살아있다
```
🗣️ **"컨테이너는 완전히 다른 건데 시각이 똑같습니다."**

**▶ [README 13-2절 · 대조군, 볼륨 없이](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L815-L832)** ⭐
```
$ docker rm -f novol-test
$ docker exec novol-test2 cat /data-inside.txt
cat: /data-inside.txt: No such file or directory   ← 사라졌다
```
🗣️ **"볼륨을 안 쓴 쪽입니다. 깨끗하게 사라졌습니다. 두 실험의 차이는 볼륨 연결 여부 하나뿐입니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `-v my-data:/data` 는? | **볼륨 `my-data` 를 컨테이너의 `/data` 폴더에 연결** |
| `sleep infinity` 는? | 컨테이너는 할 일이 끝나면 꺼짐. **계속 켜두려고** 재우는 것 |
| `docker exec` 는? | **컨테이너 안에서** 명령 실행 |
| `-f` 는? | **f**orce — 돌아가는 중이어도 강제로 |
| 볼륨 연결 확인은? | `docker inspect` → **`Type=volume`** 이면 볼륨, `Type=bind` 면 내 폴더 |
| 왜 데이터가 사라지나요? | 컨테이너 **전용 저장 층**에 있어서, 컨테이너를 지우면 같이 지워짐 |

📄 원본: [`logs/08-volume.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/08-volume.log)

---

# 9번. Git 설정 및 GitHub 연동이 확인되는가?

**🔍 이 질문이 확인하려는 것**
> **Git 설정을 마쳤고, GitHub·VSCode 연동이 됐는가.**
> 미션 요구 — `git config --list` 결과 기록 + **연동 증거(스크린샷 등)**

**① 네, 했습니다.**

**② 이렇게 했습니다**
> 이름·이메일·기본 브랜치를 설정하고 `git config --list` 를 남겼습니다.
> 커밋해서 GitHub에 올렸고, VSCode에도 GitHub 계정을 연결했습니다.

**③ 증빙**

**▶ [저장소 열기](https://github.com/ellysuh22/1-homework)** ⭐
🗣️ **"제 저장소입니다. 올린 파일과 커밋이 전부 여기 있습니다."**

**▶ [README 14-2절 · `git config --list` 결과](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L852-L874)**
```
user.name=ellysuh22
user.email=youngsuh0630@gmail.com
init.defaultbranch=main
remote.origin.url=https://github.com/ellysuh22/1-homework.git
```
🗣️ **"이름·이메일·기본 브랜치·원격 주소가 다 들어 있습니다."**

**▶ [README 14-5절 · VSCode 연동](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L929-L953)**
🗣️ **"계정 메뉴에 `ellysuh22 (GitHub)` 가 보입니다. 아래 표에 화면 어디를 봐야 하는지도 적어놨습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `config` 는? | **config**uration — 설정 |
| `--global` 은? | **이 컴퓨터 전체에** 적용 |
| 왜 이름·이메일이 필요? | 커밋에 **"누가 했는지"** 가 반드시 들어가서 |
| `origin` 은? | **원격 저장소의 기본 별명** |
| 토큰은 안전한가요? | `credential.helper` 에 **프로그램 경로만** 남고, 토큰은 **맥 키체인**에 따로 보관 |
| 커밋을 왜 나눴나요? | 작업 단위로 나누면 **뭘 언제 했는지 추적**됨 |

📄 [`logs/09-git-github.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/09-git-github.log) · [`evidence/vscode-github-account.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/vscode-github-account.png)

---

# 10번. 프로젝트 디렉토리 구조를 어떤 기준으로 구성했는지 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **폴더를 아무렇게나 만든 게 아니라 기준이 있었는가.**
> "했느냐"가 아니라 **"왜 그렇게 나눴느냐"** 를 묻는 첫 문항입니다.

**① 네, 역할별로 나눴습니다.**

**② 폴더별 역할**

| 폴더 | 뭐가 들어있나 |
|---|---|
| `app/` | 웹페이지 (HTML·CSS) |
| `templates/` | nginx 서버 설정 |
| `bindmount-demo/` | 마운트 실습용 웹페이지 |
| `scripts/` | 실습 실행 스크립트 |
| `logs/` | 실습 기록 9개 |
| `evidence/` | 브라우저·VSCode 캡처 |
| `Dockerfile` | 이미지 만드는 레시피 (맨 위) |

**③ 나눈 기준은 "이미지에 들어갈 것 / 아닐 것" 입니다**

| | 폴더 | 왜 |
|---|---|---|
| ✅ **들어감** | `app/` `templates/` | **웹서버가 돌아가려면 필요**하니까 |
| ❌ **안 들어감** | `logs/` `evidence/` `scripts/` | 웹서버와 무관. 넣으면 **용량만 커짐** |
| ❌ **일부러 뺌** | `bindmount-demo/` | **밖에 있어야** 마운트 실습이 성립 |

> 안 들어갈 것들은 `.dockerignore` 에 적어서 제외했습니다.
> **Dockerfile을 맨 위에 둔 것도 의도적**입니다. 하위 폴더로 내리면 빌드할 때 경로 옵션을 따로 줘야 합니다.

**④ 증빙**

**▶ [README 5장 · 저장소 구조](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L101-L128)**
```
├── Dockerfile             # 이미지 레시피
├── app/                   # 웹페이지            ✅ 이미지에 들어감
├── templates/             # 서버 설정           ✅ 이미지에 들어감
├── bindmount-demo/        # 마운트 실습용        ❌
├── scripts/  logs/  evidence/                 ❌
```
🗣️ **"트리 오른쪽 주석에 폴더마다 역할을 적어놨습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `.dockerignore` 는? | **이미지에 넣지 말 것 목록** |
| `scripts/` 는 뭐 하는 건가요? | 실습을 자동으로 실행하는 파일들. `bash scripts/01-terminal.sh` 하면 실행됨 |
| `logs/` 는? | 그 스크립트를 돌린 **결과 기록** (명령어+출력) |
| 왜 `app/` 인가요? | 미션에 **"웹 서버 소스코드(예: `app/`)"** 라고 예시가 있어서 |

📄 [`.dockerignore`](https://github.com/ellysuh22/1-homework/blob/main/.dockerignore)

---

# 11번. 포트/볼륨 설정을 어떤 방식으로 재현 가능하게 정리했는지 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **다른 사람이 똑같이 따라 할 수 있게 정리했는가.**
> 미션 제약 — **"README만 보고도 평가자가 동일 절차로 결과물을 확인할 수 있어야 한다"**

**① 네, 포트와 설정 두 갈래로 정리했습니다.**

**② 포트 — 용도별로 미리 정해뒀습니다**

| 포트 | 용도 |
|---|---|
| 8080 | 포트 매핑 1회차 |
| 8081 | 포트 매핑 2회차 |
| 8082 | 바인드 마운트 실습 |
| 8090 · 3000 | 보너스용 예약 (미사용) |

> 번호를 미리 갈라두면 **나중에 뭘 띄워도 겹치지 않습니다.** 실제로 8080을 겹쳐 써서 에러를 겪었기 때문에 미리 막아둔 것입니다.

**③ 설정 — 명령어 한 줄로 바꿀 수 있게 했습니다**
> 설정 파일에 `listen 80` 이라고 **박아두면 포트를 바꿀 때마다 이미지를 다시 만들어야** 합니다.
> 그래서 **환경변수로 빼놨습니다.** 지금은 이 한 줄이면 포트가 바뀝니다.
> ```
> docker run -e APP_PORT=3000 my-web:1.0
> ```

**④ 증빙**

**▶ [README 10-5절 · 설정이 채워진 결과](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L617-L620)**
```
    listen       80;      # ← ${APP_PORT} 가 치환됨
```
🗣️ **"빈칸으로 넣어두고 실행할 때 채워지게 한 겁니다."**

**▶ [README 17-1절 · 평가자용 재현 절차](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319)** ⭐
```bash
git clone https://github.com/ellysuh22/1-homework.git
docker build -t my-web:1.0 .
docker run -d -p 8080:80 --name web-8080 my-web:1.0
...
```
🗣️ **"clone 하시고 이 순서대로 치시면 똑같이 재현됩니다."**

**▶ [README 17-2절 · 다른 환경에서는](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1320-L1333)**
🗣️ **"제 컴퓨터에만 해당하는 부분은 다른 환경에서 뭘로 바꿔야 하는지까지 적어놨습니다. 포트가 겹치면 호스트 쪽 숫자만 바꾸시면 됩니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `-e` 는? | **e**nvironment — 환경변수 주입 |
| 환경변수가 뭐죠? | **밖에서 값을 넣어주는 통로.** 코드를 안 고치고 설정만 바꿀 수 있음 |
| 왜 8090·3000을 비웠나요? | 나중에 뭘 더 띄워도 **충돌하지 않게** |
| 로그는 어떻게 남겼나요? | 명령어와 출력을 **같이 기록하는 도구**를 만들어서 모든 실습을 그걸로 돌림 |

📄 [`scripts/runlog.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh)

---

# 12번. 이미지와 컨테이너의 차이를 "빌드/실행/변경" 관점에서 구분해 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **세 관점 각각으로 구분해 말할 수 있는가.**
> → 뭉뚱그리지 말고 **빌드 / 실행 / 변경을 나눠서** 답해야 합니다.

**① 네, 이미지는 붕어빵 틀, 컨테이너는 붕어빵입니다.**

**② 세 관점 요약**

| 관점 | 이미지 (틀) | 컨테이너 (붕어빵) |
|---|---|---|
| **빌드** | `docker build` 로 **만든다** | 빌드로는 안 만들어짐 |
| **실행** | 혼자서는 못 돈다 | `docker run` 으로 **찍혀 나온다** |
| **변경** | **못 고침 (읽기 전용)** | 고칠 수 있지만 **지우면 사라짐** |

## 빌드 — 만들어지는 건 이미지

**▶ [README 10-4절 · 이미지가 만들어진 순간](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L564-L582)**
```
$ docker build -t my-web:1.0 .
#8 naming to docker.io/library/my-web:1.0 done      ← 이미지 완성
```
🗣️ **"여기까지가 틀을 만든 겁니다. 아직 아무것도 돌아가지 않습니다."**

## 실행 — `run` 하면 컨테이너가 나온다

**▶ [README 11-1절 · 이미지 1개, 컨테이너 2개](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655)** ⭐
```
web-8081   0.0.0.0:8081->80/tcp   Up 5 seconds
web-8080   0.0.0.0:8080->80/tcp   Up About a minute
```
🗣️ **"이미지는 하나인데 컨테이너가 둘입니다. 하나를 지워도 틀과 나머지는 멀쩡합니다."**

## 변경 — 이미지는 못 고친다

**▶ [README 12장 · 같은 이미지인데 한쪽만 바뀜](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L730-L761)**
```
8082 (밖에 연결)  :  v1  →  파일 고침  →  v2      ← 바뀜
8080 (이미지 안)  :  이미지 내장 (app/index.html)  ← 안 바뀜
```
🗣️ **"둘 다 같은 이미지로 띄웠는데 한쪽만 바뀌었습니다. 이미지 안에 있는 건 못 고친다는 뜻입니다."**

🗣️ **"그래서 컨테이너를 지우면 데이터가 사라지고, 데이터를 밖에 두는 볼륨이 필요해집니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| "변경 관점"이 뭘 묻는 건가요? | **만든 다음에 바꿀 수 있냐** 는 것 |
| 이미지를 고치려면? | **다시 빌드**해야 함 |
| 컨테이너에서 고치면요? | 고쳐지지만 **컨테이너를 지우면 같이 사라짐** |
| 그래서 어떻게 하나요? | **데이터를 밖에 둡니다. 그게 볼륨입니다** (17번으로 연결) |

📄 [`logs/05-image-build.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/05-image-build.log) · [`logs/07-bind-mount.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/07-bind-mount.log)

---

# 13번. 컨테이너 내부 포트로 직접 접속할 수 없는 이유와 필요한 이유를 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> 질문이 **두 개**입니다.
> ① **왜 직접 접속이 안 되는가** (격리)
> ② **왜 포트 매핑이 필요한가** (다리)

**① 컨테이너가 격리된 공간이라서, `-p` 로 다리를 놓아야 닿습니다.**

**② 이렇게 설명합니다**
> 컨테이너는 **자기만의 네트워크**를 가집니다. 컨테이너 안의 `localhost` 는 **제 맥의 `localhost` 가 아닙니다.**
> 그래서 컨테이너 안에서 80번이 열려 있어도 밖에서는 보이지 않습니다.
> `-p 8080:80` 은 **"내 컴퓨터 8080으로 오는 요청을 컨테이너 80으로 넘겨라"** 는 다리입니다.

**③ 이렇게 증명했습니다**
> **`-p` 없이 컨테이너를 띄워봤습니다.** 밖에서는 안 닿는데 **안에서는 정상 응답**이 옵니다.
> **서버는 살아있는데 다리가 없어서 못 닿는 상황**을 그대로 재현한 것입니다.

**④ 증빙**

**▶ [README 15-4절 · `-p` 없이 띄운 실험](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1015-L1035)** ⭐
```
$ docker run -d --name web-noport my-web:1.0        # -p 없음

$ docker ps
web-noport   80/tcp   Up 2 seconds        # ← 호스트 포트가 없다

$ curl http://localhost:8082
curl: (7) Failed to connect                # ← 밖에서는 안 닿음

$ docker exec web-noport wget -O - http://127.0.0.1:80/env
APP_ENV=dev                                # ← 안에서는 잘 돈다
```
🗣️ **"밖에서는 실패, 안에서는 성공입니다. PORTS 칸에 `0.0.0.0:...->` 가 없는 것도 보이시죠."**

**▶ [README 15-4절 · EXPOSE는 다리가 아니다](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1037)**
🗣️ **"`EXPOSE` 는 '이 포트를 씁니다' 라고 적어둔 문서일 뿐이고, 실제로 여는 건 `-p` 뿐입니다. 위 실험에서 `EXPOSE 80` 이 있는데도 접속이 안 됐던 게 그 증거입니다."**

**▶ [README 11-4절 · 충돌하는 건 호스트 포트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L697-L708)**
```
Bind for 0.0.0.0:8080 failed: port is already allocated
```
🗣️ **"충돌하는 건 호스트 포트지 컨테이너 포트가 아닙니다. 세 컨테이너가 안쪽으로는 다 80번을 쓰는데 문제없습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| "격리"가 뭐죠? | 컨테이너가 **자기만의 공간**을 갖는 것. 네트워크도 따로 |
| `-p` 의 왼쪽/오른쪽? | **왼쪽 = 내 컴퓨터**, **오른쪽 = 컨테이너 안** |
| `docker exec ... wget` 은? | **컨테이너 안에서** 자기 자신에게 접속해본 것 |
| `127.0.0.1` 은? | **자기 자신**을 가리키는 주소 |
| `EXPOSE` 는 그럼 왜 쓰나요? | **"이 포트를 씁니다"** 라고 적어두는 문서 역할 |

📄 [`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

---

# 14번. 절대 경로/상대 경로를 어떤 상황에서 선택하는지 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **차이를 아는 것을 넘어, 언제 뭘 쓸지 판단할 수 있는가.**
> → 정의만 말하면 절반입니다. **선택 기준**을 말해야 합니다.

**① 실행 위치가 바뀔 수 있으면 절대 경로를 씁니다.**

**② 차이와 선택 기준**

> **절대 경로는 어디서 쳐도 같은 곳**이고, **상대 경로는 지금 위치에 따라 달라집니다.**

| | 언제 | 왜 |
|---|---|---|
| **절대 경로** | 스크립트 안, 설정 파일, 도커 마운트 경로 | **어디서 실행될지 모르니까** |
| **상대 경로** | 터미널에서 직접 칠 때, 프로젝트 안에서 옆 파일 가리킬 때 | **짧아서 편하니까** |

**③ 증빙**

**▶ [README 6-4절 · 위치만 바꿔서 같은 명령 실행](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L244-L250)** ⭐
```
$ cd /Users/ellysuh/Documents/1-homework/practice/docs   # 한 단계 아래로 이동

$ cat ./hello.txt
cat: ./hello.txt: No such file or directory              # ← 같은 명령인데 실패
```
🗣️ **"명령어는 글자 그대로 똑같은데, `.` 이 가리키는 폴더가 바뀌어서 실패한 겁니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `.` 과 `..` 는? | `.` = **지금 폴더**, `..` = **한 칸 위 폴더** |
| `./hello.txt` 는? | **지금 이 폴더에 있는** hello.txt |
| 왜 같은 명령이 실패하나요? | 글자는 같지만 **`.` 이 가리키는 곳이 달라져서** |
| 도커에서는? | 마운트 호스트 경로는 **반드시 절대 경로.** 그래서 `$(pwd)` 를 씀 |

📄 [`logs/01-terminal.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/01-terminal.log)

---

# 15번. 파일 권한 숫자 표기(예: 755, 644)가 어떤 규칙으로 결정되는지 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **숫자가 어떻게 나오는지 계산 규칙을 아는가.**
> → 외운 값이 아니라 **r=4, w=2, x=1 을 더한다**는 규칙을 말해야 합니다.

**① 읽기 4, 쓰기 2, 실행 1을 가진 것만 더해서 세 자리로 늘어놓은 것입니다.**

**② 계산 방법**

**1단계 — 권한 3종류**

| 기호 | 값 | 파일에서 | **폴더에서** |
|---|---|---|---|
| `r` | **4** | 내용 읽기 | 목록 보기 |
| `w` | **2** | 내용 수정 | 파일 생성/삭제 |
| `x` | **1** | 프로그램 실행 | **들어가기** ⭐ |

**2단계 — 대상 3그룹**: 소유자(나) / 그룹(팀) / 나머지(그 외)

**3단계 — 더하기**

| 조합 | 계산 | 숫자 |
|---|---|---|
| `rwx` | 4+2+1 | **7** |
| `rw-` | 4+2 | **6** |
| `r-x` | 4+1 | **5** |
| `r--` | 4 | **4** |

```
755 = rwx  r-x  r-x       644 = rw-  r--  r--
      나   팀   그외             나   팀   그외
```

**③ 폴더는 왜 755, 파일은 왜 644인가**
> **폴더의 `x` 는 '실행'이 아니라 '들어가기'** 입니다. `x` 가 없으면 문이 잠긴 것이라 못 들어갑니다.
> 그래서 **폴더는 `x` 가 필요해서 755**, 일반 문서는 실행할 일이 없으니 **`x` 를 뺀 644** 를 씁니다.

**④ 증빙**

**▶ [README 15-2절 · `ls -l` 읽는 법](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L969-L985)**
```
-rwxr-xr-x
│└┬┘└┬┘└┬┘
│ │  │  └── 기타(other):  r-x
│ │  └───── 그룹(group):  r-x
│ └──────── 소유자(user): rwx
└────────── 파일 종류 (- 파일 / d 디렉토리)
```
🗣️ **"앞 열 글자를 3개씩 끊어 읽습니다."**

**▶ [README 15-2절 · 덧셈 규칙](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L986-L1000)**
```
rwx = 4+2+1 = 7        755 = rwx r-x r-x   ← 폴더·실행파일
rw- = 4+2   = 6        644 = rw- r-- r--   ← 일반 문서
```
🗣️ **"맨 아래에 디렉토리의 `x` 는 '진입' 권한이라고 적어놨습니다. 이게 핵심입니다."**

**▶ [README 7-2절 · 실험으로 증명](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310)** ⭐
```
$ chmod 644 practice/perm-demo      # 폴더에서 x 제거
$ ls practice/perm-demo
ls: fts_read: Permission denied     # ← 못 들어감
```
🗣️ **"폴더에 644를 주면 통째로 먹통이 됩니다. 그래서 폴더는 755를 씁니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 3그룹이 누구죠? | **나(소유자) / 팀(그룹) / 그 외 모든 사람** |
| `staff` 는? | 맥의 **기본 그룹 이름** |
| 주인은 무조건 되나요? | **아닙니다.** `chmod 000` 이면 주인도 못 읽음 (root만 예외) |
| `x` 가 파일과 폴더에서 다른 이유? | 폴더는 **실행할 게 없어서** '들어가기'로 쓰임 |

📄 [`logs/02-permissions.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/02-permissions.log)

---

# 16번. "호스트 포트가 이미 사용 중"이라 포트 매핑이 실패한다면, 어떤 순서로 원인을 진단할지 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **문제를 만났을 때 순서대로 좁혀 나갈 수 있는가.**
> → 답이 아니라 **진단 절차**를 묻습니다.

**① 에러 보고 → `docker ps` 로 누가 쓰나 보고 → 끄거나, 다른 포트 쓰거나.**

**② 순서**

| 순서 | 뭘 하나 |
|---|---|
| 1 | **에러 메시지 읽기** — 어느 포트가 문제인지 나옴 |
| 2 | **`docker ps`** — 누가 그 포트를 쓰는지 찾기 |
| 3 | 없으면 **`lsof -i :8080`** — 도커 밖 프로그램 확인 |
| 4 | **끄거나, 다른 포트 쓰거나** |

> 충돌하는 건 **호스트 포트(왼쪽 숫자)** 입니다. **왼쪽만 바꾸면 됩니다.**
> 오른쪽 80은 컨테이너 여러 개가 같이 써도 문제없습니다. **이걸 모르면 컨테이너 포트까지 바꾸려다 설정이 꼬입니다.**

**③ 증빙**

**▶ [README 16-3절 · 에러 발생](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1114-L1122)**
```
Bind for 0.0.0.0:8080 failed: port is already allocated
```
🗣️ **"`0.0.0.0:8080` — 호스트 쪽 8080이 문제라고 메시지가 알려줍니다."**

**▶ [README 16-3절 · 누가 쓰는지 찾기](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1128-L1131)**
```
$ docker ps --format 'table {{.Names}}\t{{.Ports}}'
web-8080   0.0.0.0:8080->80/tcp
```
🗣️ **"`web-8080` 이 쓰고 있었습니다."**

**▶ [README 16-3절 · 해결](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1136-L1141)**
```
$ docker run -d -p 8081:80 --name web-8081 my-web:1.0     # 성공
```
🗣️ **"8081로 바꿔서 해결했습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| `lsof` 는? | **L**i**s**t **O**pen **F**iles — 열려 있는 것 목록. `lsof -i :8080` 으로 포트 점유자 확인 |
| 왜 도커 밖도 보나요? | `docker ps` 에 없으면 **다른 프로그램**이 잡고 있는 것 |
| 실패한 컨테이너는요? | `Created` 상태로 남아서 `docker rm -f` 로 치워야 이름이 안 겹침 |

📄 [`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

---

# 17번. 컨테이너 삭제 후 데이터가 사라진 경험이 있다면, 이를 방지하기 위한 대안을 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> ① **왜 사라지는지** 원리를 아는가
> ② **대안**을 아는가 (볼륨 / 바인드 마운트)
> → "볼륨 쓰면 됩니다" 만으로는 부족하고, **왜 사라지는지**부터 말해야 합니다.

**① 네, 일부러 재현해봤습니다. 대안은 볼륨입니다.**

**② 왜 사라지나**
> 컨테이너에 쓴 파일은 **그 컨테이너 전용 저장 층**에 저장됩니다.
> **컨테이너를 지우면 그 층도 함께 지워지므로** 데이터가 같이 사라집니다.
> 이미지는 읽기 전용이라 변경분을 받아주지 않습니다.

**③ 대안 두 가지**

| | 바인드 마운트 | 볼륨 |
|---|---|---|
| 연결 대상 | 내가 지정한 **내 컴퓨터 폴더** | 도커가 관리하는 **전용 저장소** |
| 표시 | `Type=bind` | `Type=volume` |
| 주 용도 | **개발 중 코드 즉시 반영** | **운영 데이터 영구 보관** |
| 이식성 | 경로에 의존 (다른 PC에서 깨질 수 있음) | 이름으로 관리돼 이식성 좋음 |

**④ 증빙**

**▶ [README 13-2절 · 볼륨 없이 하면 사라진다](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L815-L832)** ⭐
```
$ docker rm -f novol-test
$ docker exec novol-test2 cat /data-inside.txt
cat: /data-inside.txt: No such file or directory      # ← 사라졌다
```
🗣️ **"먼저 사라지는 것부터 재현했습니다."**

**▶ [README 13-1절 · 볼륨을 쓰면 남는다](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L807-L812)** ⭐
```
$ docker rm -f vol-test                                # 완전 삭제
$ docker exec vol-test2 cat /data/hello.txt
기록 시각: 2026-07-31 11:42:47                          # ← 그대로
```
🗣️ **"같은 절차인데 볼륨을 쓴 쪽은 시각까지 그대로 남았습니다."**

**▶ [README 12-2절 · 바인드 마운트는 즉시 반영](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L744-L747)**
```
    <p class="ver">v2</p>        # ← 즉시 반영됨
```
🗣️ **"바인드 마운트는 개발용입니다. 제 컴퓨터에서 고치면 재빌드 없이 바로 반영됩니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 볼륨과 마운트 차이? | **볼륨 = 도커가 관리하는 창고**, **마운트 = 내 컴퓨터 폴더 직접 연결** |
| 연결됐는지 확인은? | `docker inspect` → `Type=volume` / `Type=bind` |
| 볼륨 목록은? | `docker volume ls` |
| 왜 대조군을 만들었나요? | 볼륨만 보여주면 **"원래 안 지워지는 것 아니냐"** 는 의문이 남아서 |

📄 [`logs/08-volume.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/08-volume.log) · [`logs/07-bind-mount.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/07-bind-mount.log)

---

# 18번. 이 미션에서 가장 어려웠던 지점과, 해결 과정(가설 → 확인 → 조치)을 근거와 함께 설명할 수 있는가?

**🔍 이 질문이 확인하려는 것**
> **문제를 만났을 때 어떻게 접근하는 사람인가.**
> 요구 형식이 정해져 있습니다 — **가설 → 확인 → 조치**, 그리고 **근거**
> → 감상이 아니라 **절차**로 말해야 합니다.

**① 두 가지가 있었습니다. 용어를 익히는 것, 그리고 GitHub 업로드가 두 번 막힌 것입니다.**

## 먼저 — 용어가 제일 어려웠습니다

> 도커는 처음이라 **용어를 익히는 게 가장 어려웠습니다.**
> 명령어를 따라 칠 수는 있는데 **각각이 뭘 하는 건지 몰라서** 전체 구조가 안 잡혔습니다.
>
> 그래서 **명령어를 원래 뜻으로** 이해했습니다. `-p` 는 publish(공개), `-d` 는 detached(분리), `ps` 는 process status 이런 식으로요.
> 그러니까 **왜 이 옵션을 붙이는지**가 보이기 시작했고, `EXPOSE` 는 문서일 뿐이고 **`-p` 가 진짜 문을 연다**는 것도 그때 알았습니다.

## 그리고 — GitHub 업로드가 두 번 막혔습니다

> **로컬은 아무 문제가 없는데 원격에서만 막혀서** 원인 찾기가 어려웠습니다.

### 1차 — 계정 권한

**▶ [README 16-1절 · 가설 → 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1073-L1085)** ⭐
```
문제: 로컬 origin은 ellysuh22 인데, gh는 ellysuh22-22 로 로그인됨
가설: 인증된 계정이 저장소 주인이 아니라 쓰기 권한이 없을 것이다

$ gh api repos/ellysuh22/1-homework --jq '.permissions'
{"admin":false, ... "push":false, ...}      ← 가설이 사실로 확인
```
🗣️ **"무작정 push해서 실패를 보는 대신, API로 권한을 먼저 조회했습니다. `push: false` 가 나와서 가설이 맞았고, 저장소 주인 계정으로 재인증했습니다."**

### 2차 — 이메일 정책

**▶ [README 16-4절 · 두 번째 거부](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1143-L1161)**
```
remote: error: GH007: Your push would publish a private email address.

$ git log -1 --format='%an <%ae>'
ellysuh22 <youngsuh0630@gmail.com>        ← 실제 이메일이 들어있음
```
🗣️ **"권한을 고쳤는데 또 막혔습니다. 이번엔 권한이 아니라 정책이었습니다. 이메일 노출을 막는 옵션이 켜져 있었고, 그 옵션을 해제해서 해결했습니다."**

**▶ [README 14-3절 · 해결 후](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L893-L894)**
```
{"admin":true, ... "push":true, ...}      ← 해결 후
```
🗣️ **"아까 `push: false` 와 비교하면 바뀐 게 보입니다."**

## 배운 것

> **Git과 GitHub은 별개입니다.** 두 번 다 로컬에는 문제가 없었고, 막힌 건 전부 **원격의 권한과 정책**이었습니다.

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 왜 push 전에 권한을 봤나요? | 실패를 겪고 원인을 찾는 것보다 **먼저 확인하는 게 빠름** |
| `gh` 는? | **G**it**H**ub CLI — 터미널에서 GitHub을 다루는 도구 |
| 트러블슈팅이 몇 건인가요? | README 16장에 **7건** 정리돼 있습니다 |

📄 [`logs/09-git-github.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/09-git-github.log)

---

### 💬 다르게 물어보면

| 질문 | 답 | 보여줄 곳 |
|---|---|---|
| "기술적으로 까다로웠던 건?" | `-it` 대화형 세션을 로그로 남기는 것. `script` 로 가상 터미널을 할당해 해결 | [9-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L421-L446) |
| "어이없는 실수는?" | 상대 경로 때문에 로그가 날아간 것 (하필 실습 주제가 경로 비교) | [16-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1095-L1113) |
| "스크린샷은 왜 안 됐나?" | 맥 화면 기록 권한. 프로세스를 추적해 대상이 VS Code인 걸 찾음 | [16-5절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1180-L1207) |
| "`attach` vs `exec`?" | `exec` 는 문을 하나 더 냄(컨테이너 살아있음), `attach` 는 같은 화면(`Ctrl+C` 시 같이 죽음, 코드 130) | [9-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L483-L499) |

---

# 보너스 — 수행했는가?

**🔍 이 질문이 확인하려는 것**
> **선택 과제를 했는가.** 다섯 개 중 몇 개든 하면 크레딧입니다.

**① 다섯 개 중 하나 — GitHub SSH 키 설정을 했습니다.**

**② 이렇게 했습니다**
> 키를 만들어 GitHub에 등록하고, **HTTPS에서 SSH로 전환**해서 실제로 push까지 했습니다.
> 성공만 보여주면 **원래 열려 있던 문인지 구별이 안 되므로**, **키를 차단하면 거부되는지**까지 대조했습니다.

**③ 증빙**

**▶ [README 3-2절 · 보너스 체크리스트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L61-L71)**
```
- [x] GitHub SSH 키 설정 — 키 등록 + 인증 동작 확인 + HTTPS→SSH 전환
```
🗣️ **"다섯 개 중 이것 하나를 수행했습니다."**

**▶ [README 19장 · SSH 키 전체](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1391-L1400)** ⭐
🗣️ **"19장에 실험 A부터 D까지 정리돼 있습니다. 키가 있으면 인증되고, 차단하면 거부되고, HTTPS에서 SSH로 전환되고, 실제로 push까지 했습니다."**

**▶ [README 17-3절 · 확장을 고려한 설계](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1334-L1349)**
🗣️ **"보너스를 나중에 붙여도 기존 산출물을 안 고쳐도 되도록 설계했는데, 실제로 SSH를 추가할 때 기존 6~18장은 한 줄도 안 고쳤습니다."**

**💡 물어보면**

| 물음 | 답 |
|---|---|
| 나머지 네 개는? | Compose 3개와 환경변수는 **아직 안 했습니다** |
| 환경변수는 이미 한 것 아닌가요? | 기본 과제에서 **구조는 만들어뒀습니다**. 보너스 항목으로 정리만 안 한 상태 |
| SSH가 HTTPS보다 뭐가 나은가요? | 매번 토큰을 안 넣어도 되고, **키 기반이라 관리가 편함** |

📄 [`logs/10-ssh-key.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/10-ssh-key.log)

---

# 부록 A — 문항별 ⭐ 화면 하나만

| 번호 | 문항 | 이거 하나만 보여줘도 됨 |
|---|---|---|
| 1 | 터미널 9종 | [6-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L198-L218) — `mv` 두 경우 |
| 2 | 권한 변경 | [7-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L293-L295) — `Permission denied` |
| 3 | Docker 동작 | [8-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L324-L344) — `Server:` |
| 4 | hello-world | [9-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L403-L420) |
| 5 | 목록·정리 | [8-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L345-L370) · [8-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L371-L398) |
| 6 | 이미지 빌드 | [10-5절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L603-L612) — `starting→healthy` |
| 7 | 포트 접속 | [11-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696) — 브라우저 캡처 |
| 8 | 볼륨 영속성 | [13-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L807-L812) |
| 9 | Git/GitHub | [저장소 열기](https://github.com/ellysuh22/1-homework) |
| 10 | 구조 기준 | [5장](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L101-L128) — 폴더 트리 |
| 11 | 재현성 | [17-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319) — 재현 절차 |
| 12 | 이미지 vs 컨테이너 | [11-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655) |
| 13 | 포트 매핑 | [15-4절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1015-L1035) |
| 14 | 절대/상대 경로 | [6-4절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L244-L250) |
| 15 | 755/644 | [7-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310) |
| 16 | 포트 충돌 | [16-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1114-L1141) |
| 17 | 데이터 소실 | [13-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L815-L832) |
| 18 | 최대 난관 | [16-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1073-L1085) — `push:false` |
| 보너스 | SSH 키 | [19장](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1391-L1400) |

---

# 부록 B — "뭐 했는지 보여주세요" 로 시작할 때

**🗣️ 여는 말**
> 네, **README 하나만 보시면 전체가 파악되도록** 만들어놨습니다. 순서대로 보여드릴게요.

| 순서 | 열 곳 | 할 말 |
|---|---|---|
| 1 | [4장 검증표](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L73-L99) | "검증 항목 / 명령 / 기대 결과 / 증거를 한 표로 묶었습니다." |
| 2 | [3-1절 체크리스트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L49-L60) | "필수 아홉 개 전부 체크돼 있습니다." |
| 3 | [11-3절 브라우저](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696) | "브라우저 주소창 보이는 캡처입니다." |
| 4 | [13장 볼륨](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L764-L833) | "볼륨은 대조군까지 놓고 증명했습니다." |
| 5 | [16장 트러블슈팅](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1071-L1206) | "막힌 것들을 가설→확인→조치로 정리했습니다." |
| 6 | [17-1절 재현](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319) | "clone 하고 이대로 치시면 재현됩니다." |

---

# 부록 C — 약어 뜻 (물어보면)

| 약어 | 원말 | 뜻 |
|---|---|---|
| `pwd` | **P**rint **W**orking **D**irectory | 지금 폴더 찍기 |
| `ls` / `-l` / `-a` | **l**ist / **l**ong / **a**ll | 목록 / 자세히 / 숨김까지 |
| `cd` | **C**hange **D**irectory | 폴더 이동 (`..` = 한 칸 위, `.` = 지금 폴더) |
| `mkdir` | **M**a**k**e **Dir**ectory | 폴더 생성 |
| `cp` `mv` `rm` | **c**o**p**y / **m**o**v**e / **r**e**m**ove | 복사 / 이동 / 삭제 |
| `-r` | **r**ecursive | 폴더 안까지 통째로 |
| `cat` | con**cat**enate | 이어 붙여 출력 → 내용 보기 |
| `chmod` | **Ch**ange **Mod**e | 권한 바꾸기 |
| `r` `w` `x` | **r**ead / **w**rite / e**x**ecute | 4 / 2 / 1 (**폴더의 x = 들어가기**) |
| `curl` | **C**lient **URL** | 터미널로 주소에 접속 |
| `lsof` | **L**i**s**t **O**pen **F**iles | 포트 점유자 찾기 |
| `-p` | **p**ublish | 포트 공개 ← **다리 놓는 옵션** |
| `-d` | **d**etached | 백그라운드 실행 |
| `-v` | **v**olume | 볼륨/폴더 연결 |
| `-e` | **e**nvironment | 환경변수 주입 |
| `-t` (build) | **t**ag | 이미지 이름표 (`my-web:1.0`) |
| `-i` `-t` (run) | **i**nteractive / **t**ty | 입력 유지 / 가상 터미널 |
| `ps` | **P**rocess **S**tatus | 돌아가는 것 목록 |
| `exec` / `attach` | execute / attach | 새로 실행 / 같은 화면에 붙기 |
| `EXPOSE` | expose | **"이 포트 씁니다" 문서** — 실제로 열진 않음 |
| `origin` | origin | 원격 저장소의 **기본 별명** |
| `gh` | **G**it**H**ub CLI | 터미널용 GitHub 도구 |
| `Up 5 seconds` | — | 살아있고 켠 지 5초 |
| `Exited (137)` | 128+9 | **강제 종료**로 죽음 |
| `Exited (130)` | 128+2 | **`Ctrl+C`** 로 죽음 |
| `200 OK` | — | 정상 응답 |

---

**함께 열어둘 파일**
[`README.md`](https://github.com/ellysuh22/1-homework/blob/main/README.md) · [`REPORT.md`](https://github.com/ellysuh22/1-homework/blob/main/REPORT.md) · [`EXPLAIN.md`](https://github.com/ellysuh22/1-homework/blob/main/EXPLAIN.md) · [`CARD.md`](https://github.com/ellysuh22/1-homework/blob/main/CARD.md)
