# 평가 문항 18개 — 구두 답변 대본

> **모든 문항이 똑같은 순서로 되어 있습니다. 이 순서대로만 말하면 됩니다.**
>
> | 칸 | 어떻게 쓰나 |
> |---|---|
> | **🔍 뭘 보는 질문인가** | 평가자의 의도. **여기에만 맞춰 답하면 절대 안 벗어납니다** |
> | **① 한 줄 답** | ⭐ **먼저 이것만 말합니다.** 한두 줄이면 끝 |
> | **② 자세히** | 더 물으면 이어서 말합니다 |
> | **③ 증빙** | ▶ 링크를 `Cmd`+클릭 → GitHub이 열리고 그 줄이 노랗게 표시됩니다 |
> | **📂 코드 위치** | "코드 보여주세요" 라고 하면 여는 파일 |
> | **💡 되물으면** | 용어를 되물었을 때 답할 것 |

**말하는 요령 — 딱 세 가지**

1. **①만 말하고 멈춥니다.** 더 물으면 그때 ②를 말합니다. 먼저 다 쏟아내지 않습니다.
2. **모르면 "확인해보겠습니다"** 라고 하고 링크를 엽니다. 지어내는 게 제일 위험합니다.
3. **화면을 먼저 띄우고 말합니다.** 말로만 하면 길어지고, 화면이 있으면 짧아집니다.

| 항목 | 문항 | 성격 |
|---|---|---|
| 1. 기능 동작 검증 | **1-1 ~ 1-9** | "했느냐" — 증거 위치만 짚으면 됨 |
| 2. 동작 구조 설계 | **2-1 ~ 2-2** | "왜 그렇게 했느냐" — 판단 근거를 말해야 함 |
| 3. 핵심 기술 원리 | **3-1 ~ 3-4** | "설명할 수 있느냐" — 개념을 내 말로 |
| 4. 심층 인터뷰 | **4-1 ~ 4-3** | "겪어봤느냐" — 실제 경험을 말해야 함 |
| 5. 보너스 | SSH 키 1개 수행 | 크레딧 |

---
---

# 항목 1 — 기능 동작 검증

---

# 1-1. 터미널에서 기본 명령어로 폴더/파일 생성·이동·삭제를 수행한 흔적이 있는가?

**🔍 뭘 보는 질문인가**
> **터미널 기본 명령을 쓸 줄 아는가.**
> 미션이 지정한 9가지 — 위치 확인 · 목록(숨김 포함) · 이동 · 생성 · 복사 · 이동/이름변경 · 삭제 · 내용 확인 · 빈 파일 생성

**① 한 줄 답**
> **네. 아홉 가지를 전부 했고, 명령과 결과가 짝으로 남은 로그가 있습니다.**

**② 자세히**

터미널 명령어는 대부분 **영어 단어의 줄임말**입니다. 뜻을 알면 외울 필요가 없습니다.

| 명령 | 원래 말 | 뜻 |
|---|---|---|
| `pwd` | **P**rint **W**orking **D**irectory | 나 지금 어느 폴더에 있지? |
| `ls -la` | **l**i**s**t / **l**ong · **a**ll | 목록 보기 (자세히 · 숨김까지) |
| `cd` | **C**hange **D**irectory | 폴더 이동 |
| `mkdir` | **M**a**k**e **Dir**ectory | **폴더 만들기** |
| `touch` | touch (건드리다) | **빈 파일 만들기** |
| `cp` | **c**o**p**y | 복사 |
| `mv` | **m**o**v**e | **이동 / 이름 바꾸기** |
| `rm` | **r**e**m**ove | 삭제 |
| `cat` | con**cat**enate (이어붙이다) | 내용 보기 |

**여기서 하나만 강조하면 `mv` 입니다.**

> `mv`는 **명령은 하나인데 결과가 두 가지**입니다.
> **같은 폴더 안에서 옮기면 → 이름 바꾸기**, **다른 폴더로 옮기면 → 이동**이 됩니다.
> 미션이 "이동"과 "이름변경"을 따로 요구해서, **두 경우를 각각 실행해서 나눠 기록**했습니다.

**③ 증빙**

**▶ [README 6-1절 · 위치 확인과 목록](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L155-L180)**
```
$ pwd
/Users/ellysuh/Documents/1-homework

$ ls -la
-rw-r--r--@  1 ellysuh  staff   1207 Jul 31 20:26 .dockerignore
drwxr-xr-x@  9 ellysuh  staff    288 Jul 31 20:10 .git
```
🗣️ **"`-a`를 빼면 점으로 시작하는 `.git` 같은 숨김 파일이 안 보입니다. 그래서 붙였습니다."**

**▶ [README 6-2절 · 생성과 내용 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L181-L197)**
```
$ mkdir -p practice/docs practice/backup      # 폴더 만들기
$ touch practice/empty-note.txt               # 빈 파일 만들기
-rw-r--r--@ 1 ellysuh  staff  0 ...           # ← 크기가 0바이트
$ cat practice/hello.txt                      # 내용 보기
```
🗣️ **"`touch`로 만든 거라 크기가 0바이트입니다. 이게 '빈 파일 생성' 증거입니다."**

**▶ [README 6-3절 · 복사·이름변경·이동·삭제](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L198-L218)** ⭐ **이거 하나면 됩니다**
```
$ cp practice/hello.txt practice/backup/hello-copy.txt   # 복사
$ mv .../hello-copy.txt .../hello-renamed.txt   # 같은 폴더 → 이름변경
$ mv practice/empty-note.txt practice/docs/     # 다른 폴더 → 이동
$ rm practice/backup/hello-renamed.txt          # 파일 삭제
$ rm -r practice/backup                         # 폴더째 삭제
```
🗣️ **"`mv`가 두 번 나오는데 주석이 다릅니다. 이름 변경과 이동을 나눠서 실행한 겁니다."**

**📂 코드 위치**
[`scripts/01-terminal.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/01-terminal.sh) — 실행한 스크립트
[`logs/01-terminal.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/01-terminal.log) — 결과 원본

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `cd ..` 는? | `..` = **한 칸 위 폴더**. `.` = 지금 폴더 |
| `-r` 은? | **r**ecursive — **폴더 안까지 통째로** |
| `rm`은 왜 delete가 아니라 remove? | **휴지통이 없어서 복구가 안 됩니다.** 그래서 다른 단어를 씀 |
| `cat`이 왜 내용 보기? | 원래 **파일을 이어 붙여** 출력하는 명령. 하나만 주면 그 파일만 나옴 |
| `staff`는? | 맥의 **기본 그룹 이름**. 권한 가운데 자리가 이 그룹에 적용됨 |

---

# 1-2. 파일 권한 변경 결과가 확인되는가?

**🔍 뭘 보는 질문인가**
> **권한을 바꿀 줄 알고, 바뀐 걸 증명할 줄 아는가.**
> 미션 요구 — **파일 1개 + 디렉토리 1개**, **변경 전/후 비교**
> → 그래서 **파일·폴더 각각 × 전·후 각각**, 총 4장면이 필요합니다.

**① 한 줄 답**
> **네. 파일과 폴더 각각 전/후를 비교했고, 표시만 바뀐 게 아니라 진짜 막히는지까지 확인했습니다.**

**② 자세히**

**권한은 '문에 달린 자물쇠'** 라고 보면 됩니다. 자물쇠가 **세 개**인데, **나 / 우리 팀 / 그 외 모든 사람** 순서로 달려 있습니다.

**먼저 — 숫자 하나가 어떻게 나오나**

가진 것만 더합니다. **읽기 4 + 쓰기 2 + 실행 1**

| 가진 것 | 계산 | 숫자 |
|---|---|---|
| 읽기 + 쓰기 + 실행 | 4+2+1 | **7** |
| 읽기 + 쓰기 | 4+2 | **6** |
| 읽기 + 실행 | 4+1 | **5** |
| 읽기만 | 4 | **4** |
| 아무것도 없음 | 0 | **0** |

**① 파일: `644` → `600`**

| | 나 | 팀 | 그 외 |
|---|---|---|---|
| **전** `644` | **6** = 읽기+쓰기 | **4** = 읽기만 | **4** = 읽기만 |
| **후** `600` | **6** = 읽기+쓰기 | **0** = 전부 잠금 | **0** = 전부 잠금 |

🗣️ **"나는 그대로 읽고 쓰고, 남들은 읽지도 못하게 잠갔습니다."**

**② 폴더: `755` → `700`**

| | 나 | 팀 | 그 외 |
|---|---|---|---|
| **전** `755` | **7** = 전부 | **5** = 목록보기+**들어가기** | **5** = 목록보기+**들어가기** |
| **후** `700` | **7** = 전부 | **0** = 전부 잠금 | **0** = 전부 잠금 |

🗣️ **"나는 전부 되고, 남들은 들어오지도 못하게 했습니다."**

> ⚠️ **여기가 함정입니다 — 폴더의 `x`는 '실행'이 아니라 '들어가기'입니다.**
> 폴더는 실행할 게 없습니다. 그래서 같은 `x`인데 파일과 뜻이 다릅니다.
> **"읽기·실행"이라고 말하면 안 되고 "목록 보기·들어가기"** 라고 해야 합니다.

> **정리하면 — 두 경우 다 앞자리(나)는 그대로 두고 뒤 두 자리를 0으로 만든 것**입니다. "나만 쓰겠다"는 뜻이에요.

**여기서 제가 한 가지 더 했습니다.**

> `ls -l`의 **글자가 바뀐 것만 보여주면** 진짜 막히는 건지 알 수 없습니다.
> 그래서 `ㅊㅊ(전부 잠금)으로 만든 다음 **직접 열어봤습니다.**

**③ 증빙 — 네 장면**

**▶ [README 7-1절 · 바꾸기 전](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L262-L267)**
```
### === 변경 전 ===
-rw-r--r--@ ... perm-test.txt        # 644   ← 파일
drwxr-xr-x@ ... perm-demo            # 755   ← 폴더
```
🗣️ **"파일 하나, 폴더 하나입니다. 원래 상태예요."**

**▶ [README 7-1절 · 바꾼 후](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L269-L277)**
```
$ chmod 600 practice/perm-test.txt
-rw-------@ ... perm-test.txt        # ← 뒤 여섯 글자가 잠김

$ chmod 700 practice/perm-demo
drwx------@ ... perm-demo            # ← 남들 진입 차단
```
🗣️ **"둘 다 뒤 여섯 글자가 `------`로 바뀌었습니다."**

**▶ [README 7-2절 · 파일이 진짜 막히나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L293-L295)** ⭐
```
$ cat practice/perm-test.txt
Permission denied              # ← 내 파일인데도 막힌다
```
🗣️ **"`chmod 000`으로 잠그고 열어봤습니다. 제가 만든 파일인데도 막혔습니다."**

**▶ [README 7-2절 · 폴더가 진짜 막히나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310)** ⭐
```
$ chmod 644 practice/perm-demo      # 폴더에서 x 제거
$ ls practice/perm-demo
ls: fts_read: Permission denied     # ← 폴더에 못 들어감
```
🗣️ **"폴더는 `x`를 빼니까 못 들어갑니다. 폴더의 `x`는 '실행'이 아니라 '들어가기' 권한이거든요."**

**📂 코드 위치**
[`scripts/02-permissions.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/02-permissions.sh) · [`logs/02-permissions.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/02-permissions.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `chmod`는? | **Ch**ange **Mod**e — 권한 바꿔라 |
| `ls -l`은 왜 `-l`? | `-l`을 붙여야 **권한이 보입니다.** 안 붙이면 이름만 나옴 |
| `x`는? | e**x**ecute. **파일은 실행**, **폴더는 들어가기** |
| 왜 `000`까지 갔나요? | `600`은 제가 읽을 수 있어서 **막히는 장면을 못 만듭니다** |
| `cat`을 왜 썼나요? | 내용이 궁금해서가 아니라 **문을 열어보려고**. 막히면 `Permission denied` |

> 계산 규칙(왜 644, 왜 755)은 **3-4번**에서 자세히 다룹니다.

---

# 1-3. `docker --version`이 출력되고, Docker가 동작 가능한 상태인가?

**🔍 뭘 보는 질문인가**
> **질문이 두 개입니다.**
> ① 버전이 나오는가 (**설치됐나**)
> ② 동작 가능한 상태인가 (**엔진이 켜져 있나**)
> → **①만 답하면 절반만 답한 것**입니다. 이게 함정입니다.

**① 한 줄 답**
> **네, 둘 다 확인했습니다. 버전은 29.4.0이고, `docker info`의 Server 항목이 나와서 엔진도 살아있습니다.**

**② 자세히**

🗣️ **"확인 결과를 말씀드리기 전에, 도커가 뭐고 왜 쓰는지부터 정리하겠습니다."**

## 먼저 — 도커가 뭔가

> **프로그램이 돌아가는 데 필요한 걸 전부 상자 하나에 담아서, 어느 컴퓨터에서든 똑같이 돌아가게 해주는 도구**입니다.

**이름부터가 항구 노동자(docker)에서 왔습니다.**

> 옛날 항구에서는 짐을 **제각각 실어서** 옮기다 깨지고 잃어버리기 일쑤였습니다.
> 그런데 **규격 컨테이너**가 생기고 나서는, 안에 뭐가 들었든 상관없이 **배·기차·트럭 어디에 실어도 그대로** 옮겨졌습니다.
>
> 도커도 똑같습니다. 프로그램을 **규격 상자에 담으면** 제 맥이든, 회사 서버든, 클라우드든 **똑같이 돌아갑니다.**

## 왜 쓰나 — 세 가지

| 문제 | 도커가 해결하는 법 |
|---|---|
| **"제 컴퓨터에선 되는데요"** | 프로그램 + 설정 + 필요한 것들을 **한 상자에 통째로** 담아서, 어디서 열어도 같은 환경 |
| **설치가 지옥** | 버전 맞추고 설정 만지고 할 필요 없이 **명령 한 줄**로 받아서 실행 |
| **서로 간섭함** | 컨테이너마다 **격리**돼 있어서, 여러 개를 동시에 띄워도 안 부딪힘 |

> **이게 미션이 도커를 시킨 이유입니다.** 미션 문구에 **"팀원 누구나 같은 방식으로 실행·배포·디버깅할 수 있는 환경"** 이라고 적혀 있는데, 그 '같은 방식'을 만들어주는 게 도커입니다.

## 그래서 이 질문이 왜 두 개냐면 — 식당에 비유하면

> `docker --version`은 **메뉴판이 있는지** 확인하는 것입니다.
> 그런데 메뉴판이 있어도 **주방이 꺼져 있으면** 음식이 안 나옵니다.
>
> 여기서 **주방이 '데몬(엔진)'** 입니다. 실제로 컨테이너를 만들고 돌리는 건 데몬이에요.
> **엔진이 꺼져 있어도 버전은 그냥 나옵니다.** 그래서 `docker info`로 **주방이 켜져 있는지**까지 확인했습니다.

**③ 증빙 — 터미널로 직접 + 기록으로 한 번 더**

## ⌨️ 지금 터미널에서 보여드리겠습니다

```bash
docker version
```
> **`docker --version`(대시 두 개)과 다른 명령입니다.**
> `--version`은 **한 줄**만 나오고, `version`은 **`Client:` 와 `Server:` 두 덩어리**가 나옵니다.

🗣️ **"위가 `Client:`, 아래가 `Server:`입니다. 이 `Server:` 덩어리가 엔진이 살아있다는 증거입니다. 꺼져 있으면 여기에 `Cannot connect to the Docker daemon`이 뜹니다. 한 명령으로 '설치됐나'와 '켜졌나'가 동시에 확인됩니다."**

```bash
docker context ls
```
🗣️ **"별표가 붙은 `orbstack`이 지금 쓰는 엔진입니다. 맥에는 리눅스 커널이 없고 학교 정책상 `sudo`도 막혀 있어서 OrbStack으로 우회했습니다. 명령어는 완전히 똑같습니다."**

## 📄 기록으로도 남겨뒀습니다 — 링크 2개

| ▶ 열 곳 | 보이는 것 |
|---|---|
| **[README 8-1절 · 설치 및 데몬 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L324-L344)** ⭐ | `docker --version` → **29.4.0** / `docker info` → **`Server:` 섹션** |
| **[logs/03-docker-check.log:31](https://github.com/ellysuh22/1-homework/blob/main/logs/03-docker-check.log#L31)** | 자른 것 없는 **원본**. **31번 줄이 `Server:`** |

🗣️ **"README는 핵심만 뽑은 거고, 로그는 가공하지 않은 원본입니다. 두 개를 대조해 보실 수 있습니다."**

**📂 코드 위치**
[`scripts/03-docker-check.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/03-docker-check.sh) · [`logs/03-docker-check.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/03-docker-check.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 도커가 한마디로 뭐죠? | **프로그램에 필요한 걸 상자 하나에 담아, 어디서든 똑같이 돌아가게 하는 도구** |
| 가상머신이랑 뭐가 다른가요? | **가상머신은 컴퓨터를 통째로 하나 더** 만드는 것이라 무겁고, **도커는 프로그램만** 격리해서 **가볍고 빠릅니다** |
| 클라이언트 / 데몬 차이? | **클라이언트** = 내가 치는 `docker` 명령(주문서) / **데몬** = 실제로 돌리는 엔진(주방) |
| OrbStack이 뭐죠? | Docker Desktop 같은 도구인데 **관리자 권한 없이** 엔진을 돌려줍니다 |
| 미션에서 시킨 건가요? | 네. 서울캠퍼스는 `sudo`가 막혀 있어 **미션에 OrbStack을 쓰라고 명시**돼 있습니다 |

---

# 1-4. `docker run hello-world`가 정상 실행되는가?

**🔍 뭘 보는 질문인가**
> **컨테이너를 실제로 띄울 수 있는가.** 설치 확인의 마지막 단계입니다.

**① 한 줄 답**
> **네. `Hello from Docker!`가 정상 출력됐습니다.**

**② 자세히**

이건 **메시지 한 줄 뿌리고 바로 꺼지는 설치 확인용 이미지**입니다.

재미있는 건, **출력 내용 자체가 도커의 동작 순서를 설명해 준다**는 겁니다. 그래서 통째로 남겼습니다.

**③ 증빙**

**▶ [README 9-1절 · hello-world](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L403-L420)**
```
Hello from Docker!
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image
 3. The Docker daemon created a new container
 4. The Docker daemon streamed that output to the client
```
🗣️ **"이 1~4번이 도커가 일하는 순서입니다. 클라이언트가 데몬에 요청 → 데몬이 이미지를 받아옴 → 컨테이너를 만듦 → 결과를 다시 전달."**

**📂 코드 위치**
[`scripts/04-container-basics.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/04-container-basics.sh) · [`logs/04-container-basics.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 끝났는데 어디 갔나요? | **꺼진 것뿐입니다.** `docker ps -a`에 기록이 남아 있습니다 |
| `-d`는 왜 안 붙였나요? | 한 번 출력하고 끝나는 거라 **백그라운드로 돌릴 이유가 없어서** |

---

# 1-5. 이미지/컨테이너 목록 확인 및 정리 흔적이 있는가?

**🔍 뭘 보는 질문인가**
> **도커 기본 운영을 할 줄 아는가.**
> ① 이미지와 컨테이너를 **구분**해서 볼 줄 아는가
> ② 돌아가는 것과 끝난 것을 **구분**할 줄 아는가
> ③ 다 쓴 컨테이너를 **정리**할 줄 아는가

**① 한 줄 답**
> **네. 이미지와 컨테이너를 따로 확인했고, 컨테이너는 중지하고 삭제하는 것까지 했습니다.**

**② 자세히 — 먼저 용어부터**

🗣️ **"목록 얘기를 하기 전에, 이미지와 컨테이너가 뭔지부터 정리하겠습니다. 이 둘이 달라서 보는 명령도 따로 있거든요."**

> **이미지는 붕어빵 틀, 컨테이너는 붕어빵입니다.**

| | 이미지 (틀) | 컨테이너 (붕어빵) |
|---|---|---|
| **뭔가** | 실행에 필요한 걸 **전부 담아 굳혀놓은 파일** | 그 틀로 **실제로 찍어내서 돌아가는 것** |
| **바뀌나** | **안 바뀜** (읽기 전용) | 돌거나 · 꺼지거나 · 지워짐 |
| **개수** | 1개 | 그 1개로 **여러 개** 찍을 수 있음 |
| **만드는 법** | `docker build` | `docker run` |
| **보는 법** | `docker images` | `docker ps` / `docker ps -a` |

🗣️ **"틀은 하나인데 붕어빵은 여러 개 굽죠. 그래서 `docker images`는 틀 목록, `docker ps`는 붕어빵 목록입니다."**

**제가 쓴 명령**

| | 목록 보기 | 정리 |
|---|---|---|
| **이미지** | `docker images` | 실습에 계속 써야 해서 유지 |
| **컨테이너** | `docker ps` (돌아가는 것)<br>`docker ps -a` (끝난 것까지) | `docker stop` → `docker rm` |

**③ 증빙 — 터미널로 직접 + 기록으로 한 번 더**

## ⌨️ 지금 터미널에서 보여드리겠습니다

```bash
docker images
```
🗣️ **"이게 틀 목록입니다. `nginx`·`ubuntu`·`hello-world`는 받아온 거고, `my-web:1.0`은 제가 Dockerfile로 만든 겁니다."**

```bash
docker ps -a
```
🗣️ **"이게 붕어빵 목록입니다. `-a`를 붙이면 끝난 것까지 나옵니다. 실습에 쓴 컨테이너는 `rm`으로 정리해서 지금은 남아 있지 않습니다."**

## 📄 기록으로도 남겨뒀습니다 — 링크 2개

| ▶ 열 곳 | 보이는 것 |
|---|---|
| **[README 8-3절 · 목록 · 운영 · 정리](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L371-L398)** ⭐ | `ps` / `ps -a` / `logs` / `stats` / `stop` 이 **한 곳에** |
| **[logs/04-container-basics.log:189-202](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log#L189-L202)** | **중지 → 삭제 → 목록에서 사라짐** (정리 완료 증거) |

🗣️ **"README는 핵심만 뽑았고, 로그 189~202번 줄이 정리 과정 원본입니다. `stop`으로 끄고 `rm`으로 지운 다음, `ps -a`로 정말 사라졌는지까지 확인했습니다."**

**더 물으면 — 이미지 다운로드 증거**

**▶ [README 8-2절 · 다운로드와 목록](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L345-L370)**
```
$ docker pull hello-world
Status: Downloaded newer image for hello-world:latest
```
> **`pull`을 왜 따로 쳤나** — `run`만 해도 이미지는 자동으로 받아집니다. 그런데 **이미 받아놨으면 다운로드 줄이 아예 안 나옵니다.** 언제 치느냐에 따라 로그가 달라져서, `pull`을 분리해 **항상 같은 모양으로** 남겼습니다.

**📂 코드 위치**
[`logs/03-docker-check.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/03-docker-check.log) · [`logs/04-container-basics.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/04-container-basics.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `tick-demo`가 뭐죠? | **1초마다 숫자를 세는 컨테이너.** 로그·자원·중지를 실습하려고 띄운 것 |
| `--no-stream`은? | `stats`는 화면이 **계속 갱신돼서 파일로 저장이 안 됩니다.** 이걸 붙이면 한 장면만 찍고 끝 |
| `--tail 5`는? | **끝에서 5줄만.** 안 붙이면 수백 줄이 다 나옴 |
| `Exited (137)`은? | **128 + 9** = 강제 종료로 죽음 |
| `ps`는? | **P**rocess **S**tatus (돌아가는 것 상태) |
| 이미지는 왜 안 지웠나요? | **실습에 계속 써야 해서.** 지우려면 `docker rmi` |

---

# 1-6. Dockerfile로 이미지 빌드가 가능한가?

**🔍 뭘 보는 질문인가**
> **Dockerfile을 직접 써서 이미지를 만들 수 있는가.**
> 미션 요구 — ① 어떤 베이스를 골랐는지 ② **내가 얹은 것 각각의 목적** ③ 빌드/실행 결과
> → **"만들었다"가 아니라 "왜 이렇게 만들었나"** 를 묻습니다.

**① 한 줄 답**
> **네. nginx를 바탕으로 `my-web:1.0`을 만들었고, 컨테이너 실행까지 성공했습니다.**

**② 자세히**

**Dockerfile은 요리 레시피입니다.** `docker build`가 이 레시피를 위에서 아래로 읽으면서 이미지를 만듭니다.

저는 **이미 웹서버가 들어있는 완성품**(`nginx:1.29-alpine`)을 가져와서 **제 것 여섯 가지를 얹었습니다.**

| 지시어 | 얹은 것 | 왜 |
|---|---|---|
| `FROM` | nginx 완성품 | **처음부터 다 만들 필요가 없어서** |
| `LABEL` | 이름·설명·버전 | 이미지가 쌓여도 **출처 추적** |
| `ARG`/`ENV` | `APP_PORT`, `APP_ENV` | **설정을 코드에서 분리** ⭐ |
| `COPY app/` | 내가 만든 웹페이지 | **정적 콘텐츠 교체** (미션 요구) |
| `COPY templates/` | 서버 설정 | **설정 교체** (미션 요구) |
| `EXPOSE` | 쓰는 포트 선언 | 문서용 |
| `HEALTHCHECK` | 10초마다 자가진단 | **"떠 있는 것"과 "정상인 것"은 다르니까** |

> **버전을 `1.29`까지 못 박은 것도 의도**입니다. `nginx:alpine`처럼 버전을 안 쓰면 "그때그때 최신"이라, 오늘 제 컴퓨터와 다음 달 평가자 컴퓨터가 다른 걸 받게 됩니다. **재현이 깨집니다.**

**여기서 한 발 더 나갔습니다.**
> **"빌드 성공"이라는 글자만으로는 제가 넣은 게 진짜 들어갔는지 알 수 없습니다.**
> 그래서 `docker inspect`로 하나씩 다시 꺼내 확인했고, **헬스체크가 `starting` → `healthy`로 바뀌는 것**까지 기록했습니다.

**③ 증빙 — 터미널로 직접 + 기록으로 한 번 더**

## ⌨️ 지금 터미널에서 보여드리겠습니다

**① 제가 쓴 Dockerfile — 알맹이만**

```bash
grep -vE '^\s*#|^\s*$' Dockerfile
```
🗣️ **"주석을 걷어내면 14줄입니다. `FROM`으로 완성된 nginx를 가져오고, 그 아래가 제가 얹은 여섯 가지입니다."**

**② 그래서 이미지가 만들어졌나**

```bash
docker images | grep my-web
```
🗣️ **"`my-web:1.0`이 목록에 있습니다. 받아온 게 아니라 제가 빌드한 겁니다."**

**③ 제가 넣은 게 진짜 이미지에 박혔나** ⭐

```bash
docker inspect my-web:1.0 --format '{{json .Config.Healthcheck}}'
```
🗣️ **"빌드 성공이라는 글자만으로는 제가 넣은 게 진짜 들어갔는지 알 수 없습니다. 그래서 이미지에서 다시 꺼내 확인했습니다. 제가 쓴 헬스체크 명령이 그대로 나옵니다."**

## 📄 기록으로도 남겨뒀습니다 — 링크 2개

| ▶ 열 곳 | 보이는 것 |
|---|---|
| **[README 10-4절 · 빌드 성공](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L564-L582)** | `docker build` → **`naming to ... my-web:1.0 done`** (완성된 줄) |
| **[logs/05-image-build.log:249-259](https://github.com/ellysuh22/1-homework/blob/main/logs/05-image-build.log#L249-L259)** ⭐ | **`Health: starting` → 10초 뒤 → `Health: healthy`** |

🗣️ **"두 번째가 핵심입니다. 헬스체크를 넣기만 한 게 아니라, `starting`에서 `healthy`로 바뀌는 걸 시간차를 두고 찍어서 실제로 도는 걸 보였습니다."**

**더 물으면 — 설정이 빈칸에서 채워진 증거**

**▶ [README 10-5절 · 설정이 채워졌나](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L617-L625)**
```
    listen       80;                     # ← ${APP_PORT}가 채워짐
    add_header X-App-Env  "dev"  always; # ← ${APP_ENV}가 채워짐
```
🗣️ **"설정을 빈칸으로 넣어뒀는데, 컨테이너가 켜질 때 실제 값으로 채워졌습니다."**

**📂 코드 위치** ⭐ "코드 보여주세요" 하면 여기
[`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) — 지시어마다 왜 썼는지 주석
[`templates/default.conf.template`](https://github.com/ellysuh22/1-homework/blob/main/templates/default.conf.template) — 빈칸이 든 서버 설정
[`app/index.html`](https://github.com/ellysuh22/1-homework/blob/main/app/index.html) — 내가 만든 웹페이지
[`.dockerignore`](https://github.com/ellysuh22/1-homework/blob/main/.dockerignore) — 이미지에 넣지 말 것 목록
[`logs/05-image-build.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/05-image-build.log)

> ⚠️ **Dockerfile은 263줄인데 실제 명령은 14줄**입니다. 주석이 250줄이에요.
> 그냥 열면 스크롤 지옥이니 **터미널에 이렇게 쳐서 알맹이만 띄우세요:**
> ```bash
> grep -vE '^\s*#|^\s*$' Dockerfile
> ```
> 🗣️ **"주석을 걷어내면 14줄입니다. 주석이 긴 건 의도한 건데, 지시어마다 '왜 이걸 썼는지'를 적어놨습니다."**

**💡 되물으면**

| 물음 | 답 |
|---|---|
| Dockerfile이 뭐죠? | **이미지 만드는 순서를 적어둔 레시피 파일** |
| 왜 Dockerfile로 만드나요? | 손으로 만들면 **뭘 했는지 안 남고 재현이 안 됩니다** |
| `FROM`은? | **어디서 시작할지.** 처음부터 다 만들 필요가 없음 |
| `-t`는? | **t**ag — 이미지 이름표 (`my-web:1.0`) |
| `1.0`은? | **버전(태그).** 안 붙이면 `latest`가 자동으로 붙음 |
| `--progress=plain`은? | 기본 모드는 애니메이션이라 **파일에 깨진 기호만 남아서** |
| alpine이 뭐죠? | **용량을 확 줄인 리눅스.** nginx가 Debian은 200MB, Alpine은 50MB 정도 |

---

# 1-7. 매핑된 포트로 접속이 가능한가?

**🔍 뭘 보는 질문인가**
> **포트 매핑을 직접 설정하고 접속을 확인했는가.**
> 미션 제약 — 증거는 **주소창(포트 포함)과 화면이 함께** 보여야 함
> → 로그만으로는 부족하고 **브라우저 캡처**가 필요합니다.

**① 한 줄 답**
> **네. 8080과 8081 두 포트로 접속되고, 주소창이 보이는 브라우저 캡처도 있습니다.**

**② 자세히 — 강 건너 섬입니다**

🗣️ **"결과를 보여드리기 전에, 왜 이 작업이 필요한지부터 말씀드리겠습니다."**

> 컨테이너는 **격리된 공간**입니다. **강 건너 섬**이라고 보시면 돼요.
> 섬에도 80번 건물이 있고 제 컴퓨터에도 80번 건물이 있는데 **완전히 다른 건물**입니다.
> 그래서 **다리를 놓지 않으면 밖에서 섬에 닿을 수가 없습니다.** `-p`가 그 다리입니다.

```
docker run -p 8080:80
              ─┬─ ─┬
               │   └ 컨테이너 안쪽 문 (섬)
               └──── 내 컴퓨터 쪽 문 (뭍)
```

| | 뜻 |
|---|---|
| **왼쪽 8080** | 내 컴퓨터 포트 — **브라우저에 치는 번호**. 겹치면 충돌 |
| **오른쪽 80** | 컨테이너 안 nginx가 듣는 포트 — 격리돼 있어 **여러 컨테이너가 다 80을 써도 무방** |

**저는 같은 이미지 하나로 컨테이너 두 개를 서로 다른 포트에 띄웠습니다.**

**③ 증빙 — 화면 하나면 끝납니다**

**▶ [README 11-3절 · 브라우저 접속 화면](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696)** ⭐⭐
🗣️ **"주소창에 `localhost:8080`, 아래에 페이지가 떠 있습니다. 접속됩니다."**

---
**더 물으면 열기**

**▶ [README 11-1절 · 두 개 띄운 명령](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655)**
```
$ docker run -d -p 8080:80 --name web-8080 my-web:1.0
$ docker run -d -p 8081:80 --name web-8081 my-web:1.0
```
🗣️ **"왼쪽 포트만 다르고 오른쪽 80은 둘 다 같습니다."**

**▶ [README 11-2절 · curl 응답](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L656-L682)**
```
$ curl -i http://localhost:8080
HTTP/1.1 200 OK
```
🗣️ **"`200 OK` — 정상 응답입니다. 8081도 같습니다."**

**📂 코드 위치**
[`evidence/browser-8080.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/browser-8080.png) · [`evidence/browser-8081.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/browser-8081.png) · [`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| **"두 캡처가 같은 화면 아닌가요?"** ⚠️ | **"맞습니다. 그게 핵심입니다.** 이미지 하나로 두 개를 띄웠으니 내용은 같아야 정상이고, **주소창 번호만 다릅니다.** 화면까지 달랐다면 서로 다른 이미지를 쓴 게 됩니다." |
| `-p 8080:80`은? | **내 컴퓨터 8080 → 컨테이너 80** 연결 |
| `-d`는? | **d**etached — 백그라운드. 터미널을 안 붙잡음 |
| `-i`는? | 응답 헤더까지 표시 → `200 OK` 확인용 |
| 왜 `curl`도 했나요? | `curl`은 **글자라 로그로 남습니다.** 캡처는 눈으로, 로그는 기록으로 |
| 8080을 또 쓰면? | **충돌합니다.** 일부러 해봤고 `port is already allocated`가 났습니다 → **4-1번** |

---

# 1-8. Docker 볼륨 데이터가 컨테이너 삭제 후에도 유지되는가?

**🔍 뭘 보는 질문인가**
> **볼륨이 데이터를 지켜준다는 걸 증명할 수 있는가.**
> 미션 요구 — 생성/연결/검증 절차 + **컨테이너 삭제 전/후 비교**
> → **"삭제했다"와 "그래도 남아있다"** 가 둘 다 보여야 합니다.

**① 한 줄 답**
> **네. 컨테이너를 완전히 지운 뒤 새 컨테이너에서 읽었는데 기록 시각까지 그대로 나왔습니다.**

**② 자세히 — 호텔 방과 사물함**

🗣️ **"결과를 보여드리기 전에, 볼륨이 뭐고 왜 필요한지부터 말씀드리겠습니다."**

> **컨테이너에 쓴 파일은 컨테이너를 지우면 같이 사라집니다.**
> **호텔 방**이라고 보시면 돼요. 방 안에 짐을 두고 체크아웃하면 짐도 없어집니다.
>
> **볼륨은 호텔 밖에 따로 빌린 사물함**입니다. 방을 빼도 사물함은 그대로 남습니다.

| | 어디에 저장되나 | 컨테이너를 지우면 |
|---|---|---|
| **그냥 컨테이너 안** | 컨테이너 **전용 층** | **같이 사라짐** ❌ |
| **볼륨 연결** | 도커가 관리하는 **별도 공간** | **그대로 남음** ✅ |

**왜 이게 필요하냐면** — 컨테이너는 **자주 지우고 다시 만드는 게 정상**이기 때문입니다. 버전을 올리거나 설정을 바꾸면 새로 띄웁니다. 그때마다 **회원 정보나 업로드한 파일이 날아가면 안 되니까**, 데이터는 컨테이너 **밖에** 둡니다.

```
docker run -v my-data:/data ...
              ───┬─── ──┬──
                 │       └ 컨테이너 안에서 보일 위치
                 └──────── 볼륨 이름 (컨테이너 밖 저장소)
```

**여기서 한 가지 더 했습니다.**
> 볼륨 실험만 보여드리면 **"원래 안 지워지는 것 아니냐"** 는 의문이 남습니다.
> 그래서 **볼륨을 안 쓴 대조군**으로 똑같은 절차를 한 번 더 밟았습니다.
> **두 실험의 차이가 볼륨 연결 여부 하나뿐**이라, 볼륨이 원인이라는 게 논리적으로 성립합니다.

**③ 증빙 — 네 장면**

**▶ [README 13-1절 · 삭제 전](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L786-L794)**
```
$ docker exec vol-test cat /data/hello.txt
기록 시각: 2026-07-31 11:42:47
```
🗣️ **"지우기 전 내용입니다. 이 시각을 기억해 두세요."**

**▶ [README 13-1절 · 컨테이너 삭제](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L796-L805)**
```
$ docker rm -f vol-test          ← 컨테이너 완전 삭제
$ docker volume ls
local     my-data                ← 볼륨은 그대로 남아있다
```
🗣️ **"컨테이너는 사라졌는데 볼륨은 남아 있습니다."**

**▶ [README 13-1절 · 삭제 후 새 컨테이너에서 읽기](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L807-L812)** ⭐ **이거 하나면 됩니다**
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

**📂 코드 위치**
[`scripts/08-volume.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/08-volume.sh) · [`logs/08-volume.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/08-volume.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `-v my-data:/data`는? | **볼륨 `my-data`를 컨테이너의 `/data` 폴더에 연결** |
| `sleep infinity`는? | 컨테이너는 할 일이 끝나면 꺼집니다. **계속 켜두려고** 재우는 것 |
| `docker exec`는? | **컨테이너 안에서** 명령 실행 |
| `-f`는? | **f**orce — 돌아가는 중이어도 강제로 |
| 연결됐는지 확인은? | `docker inspect` → **`Type=volume`**이면 볼륨, `Type=bind`면 내 폴더 |
| 왜 데이터가 사라지나요? | 컨테이너 **전용 저장 층**에 있어서, 컨테이너를 지우면 같이 지워짐 |
| 바인드 마운트와 차이? | **4-2번**에 표로 정리해뒀습니다 |

---

# 1-9. Git 설정 및 GitHub 연동이 확인되는가?

**🔍 뭘 보는 질문인가**
> **Git 설정을 마쳤고, GitHub·VSCode 연동이 됐는가.**
> 미션 요구 — `git config --list` 결과 + **연동 증거(스크린샷 등)**

**① 한 줄 답**
> **네. `git config --list` 결과를 남겼고, GitHub 업로드와 VSCode 로그인 캡처까지 있습니다.**

**② 자세히**

> **Git과 GitHub은 다릅니다.**
> **Git**은 **내 컴퓨터에 깔린 프로그램**입니다. 저장 기록을 관리해요.
> **GitHub**은 **인터넷 사이트**입니다. 그 기록을 올려두고 남과 공유하는 곳이에요.
>
> 카톡으로 치면 **Git은 내 폰의 사진첩**, **GitHub은 클라우드 백업**입니다.

제가 한 것:
1. 이름·이메일·기본 브랜치 설정 → `git config --list`로 확인
2. 작업 단위로 나눠 커밋 (골격 → 스크립트 → 로그 → 증거 → 문서)
3. `git push`로 GitHub에 업로드
4. VSCode에 GitHub 계정 연결

**③ 증빙**

**▶ [저장소 열기](https://github.com/ellysuh22/1-homework)** ⭐ **이거 하나면 됩니다**
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
🗣️ **"계정 메뉴에 `ellysuh22 (GitHub)`가 보입니다. 화면 어디를 봐야 하는지도 표로 적어놨습니다."**

**📂 코드 위치**
[`logs/09-git-github.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/09-git-github.log) · [`evidence/vscode-github-account.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/vscode-github-account.png)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `config`는? | **config**uration — 설정 |
| `--global`은? | **이 컴퓨터 전체에** 적용 |
| 왜 이름·이메일이 필요? | 커밋에 **"누가 했는지"** 가 반드시 들어가서 |
| `origin`은? | **원격 저장소의 기본 별명** |
| 토큰은 안전한가요? | 설정에는 **프로그램 경로만** 남고, 토큰은 **맥 키체인**에 따로 보관됩니다 |
| 이메일이 공개돼 있는데요? | **의도한 것입니다.** 민감정보가 아니고, [README 18-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1358-L1378)에 판단 근거를 적어놨습니다 |
| 커밋을 왜 나눴나요? | 작업 단위로 나누면 **뭘 언제 했는지 추적**됩니다 |

---
---

# 항목 2 — 동작 구조 설계

> 여기부터는 **"왜 그렇게 했느냐"** 를 묻습니다. 했다는 사실이 아니라 **판단 근거**를 말해야 합니다.

---

# 2-1. 프로젝트 디렉토리 구조를 어떤 기준으로 구성했는지 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **폴더를 아무렇게나 만든 게 아니라 기준이 있었는가.**
> "했느냐"가 아니라 **"왜 그렇게 나눴느냐"** 를 묻는 첫 문항입니다.

**① 한 줄 답**
> **네. 기준은 하나입니다 — "이미지에 들어갈 것이냐, 아니냐."**

**② 자세히**

**이삿짐 싸기**로 생각하면 쉽습니다. 새 집에 **가져갈 짐**과 **두고 갈 짐**을 나누는 거예요.

| | 폴더 | 뭐가 들어있나 | 왜 |
|---|---|---|---|
| ✅ **가져감** | `app/` | 웹페이지 (HTML·CSS) | **웹서버가 돌려면 필요** |
| ✅ **가져감** | `templates/` | nginx 서버 설정 | **웹서버가 돌려면 필요** |
| ❌ **두고 감** | `logs/` `evidence/` `scripts/` | 실습 기록·캡처·스크립트 | 웹서버와 무관. 넣으면 **용량만 커짐** |
| ❌ **일부러 뺌** | `bindmount-demo/` | 마운트 실습용 페이지 | **밖에 있어야** 마운트 실습이 성립 |

> 안 가져갈 것들은 [`.dockerignore`](https://github.com/ellysuh22/1-homework/blob/main/.dockerignore)에 적어서 제외했습니다.

**나눈 이유가 하나 더 있습니다 — 콘텐츠와 설정의 분리**

> `app/`은 **"무엇을 보여줄지"**, `templates/`는 **"서버를 어떻게 굴릴지"** 입니다.
> Dockerfile에서 `COPY`가 두 번 나오는데 **목적지가 서로 다른 것**도 이 구분 때문입니다.

**`Dockerfile`을 맨 위에 둔 것도 의도입니다.**
> 하위 폴더로 내리면 `docker build`에 **경로 옵션을 따로 줘야** 하고, 나중에 Compose를 붙일 때도 설정이 복잡해집니다.

**③ 증빙**

**▶ [README 5장 · 저장소 구조](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L101-L128)** ⭐
```
├── Dockerfile             # 이미지 레시피
├── app/                   # 웹페이지            ✅ 이미지에 들어감
├── templates/             # 서버 설정           ✅ 이미지에 들어감
├── bindmount-demo/        # 마운트 실습용        ❌
├── scripts/  logs/  evidence/                 ❌
```
🗣️ **"트리 오른쪽 주석에 폴더마다 역할과 포함 여부를 적어놨습니다."**

**📂 코드 위치**
[`.dockerignore`](https://github.com/ellysuh22/1-homework/blob/main/.dockerignore) — 제외 목록 (여기가 이 답의 물증입니다)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `.dockerignore`는? | **이미지에 넣지 말 것 목록** |
| `scripts/`는 뭐 하는 건가요? | 실습을 자동 실행하는 파일들. `bash scripts/01-terminal.sh` |
| `logs/`는? | 그 스크립트를 돌린 **결과 기록** (명령어+출력) |
| 왜 하필 `app/`? | 미션에 **"웹 서버 소스코드(예: `app/`)"** 라고 예시가 있어서 그대로 맞췄습니다 |
| `bindmount-demo`는 왜 밖에? | 마운트는 **바깥 폴더를 연결하는 실습**이라, 이미지 안에 있으면 실습 자체가 안 됩니다 |

---

# 2-2. 포트/볼륨 설정을 어떤 방식으로 재현 가능하게 정리했는지 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **다른 사람이 똑같이 따라 할 수 있게 정리했는가.**
> 미션 제약 — **"README만 보고도 평가자가 동일 절차로 결과물을 확인할 수 있어야 한다"**

**① 한 줄 답**
> **포트는 용도별로 번호를 미리 갈라뒀고, 설정은 이미지에 박지 않고 실행할 때 넣게 했습니다.**

**② 자세히 — 왜 이게 문제가 되냐면**

**포트와 볼륨은 이미지에 안 담깁니다.** `docker run` 할 때 정하는 값이에요.

```
docker build                            →  이미지 완성 (웹서버·HTML은 여기 담김)
docker run -p 8080:80 -v my-data:/data  →  포트·볼륨은 '여기서' 정함
```

> 그래서 평가자가 clone해서 빌드하면 **이미지는 똑같이 나오지만**, **"몇 번 포트로 띄우라는 거지?"** 는 이미지가 알려주지 않습니다. **적어둬야** 합니다.

**재현이 깨지는 원인 3가지를 각각 막았습니다.**

| 깨지는 원인 | 제가 한 조치 |
|---|---|
| **① 포트가 겹친다** | 용도별로 번호를 갈라두고, 겹치면 **왼쪽 숫자만 바꾸라고** 명시 |
| **② 설정을 못 바꾼다** | 이미지에 박지 않고 **밖에서 넣게** → 명령 한 줄로 변경 |
| **③ 볼륨을 어디 붙였는지 모른다** | 볼륨명(`my-data`)과 경로(`/data`)를 **재현 절차에 그대로** 기재 |

**포트 배정**

| 포트 | 용도 |
|---|---|
| 8080 · 8081 | 포트 매핑 1·2회차 |
| 8082 | 바인드 마운트 실습 |
| 8090 · 3000 | 나중을 위해 비워둠 |

**설정 분리** ⭐ **여기가 핵심입니다**

```
[박아둔 경우]      listen 80;            → 바꾸려면 파일 수정 + 이미지 재빌드
[빈칸으로 둔 경우]  listen ${APP_PORT};   → docker run -e APP_PORT=3000 한 줄
```

🗣️ **"설정을 코드에 박아두면 못 바꿉니다. 빈칸으로 두고 실행할 때 채우게 했습니다. 이미지는 그대로 두고 명령만 바꾸면 됩니다."**

**재현성 — 로그 수집 자체를 도구로 만들었습니다**

> 미션에 **"명령어 입력과 출력 결과가 함께 포함되어야 한다"** 는 조항이 있는데, 손으로 복붙하면 명령어를 빠뜨리기 쉽습니다.
> 그래서 [`scripts/runlog.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh)에 도구를 만들어 **모든 실습을 그걸로 실행**했습니다. **구조적으로 누락이 불가능합니다.**

**③ 증빙**

**▶ [README 17-1절 · 평가자용 재현 절차](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319)** ⭐ **이거 하나면 됩니다**
```bash
git clone https://github.com/ellysuh22/1-homework.git
docker build -t my-web:1.0 .
docker run -d -p 8080:80 --name web-8080 my-web:1.0
...
```
🗣️ **"clone 하시고 이 순서대로 치시면 똑같이 재현됩니다. 정리 명령까지 넣어놨습니다."**

**▶ [README 10-5절 · 빈칸이 실제로 채워진 것](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L617-L625)** ⭐
```
    listen       80;                      # ← ${APP_PORT}가 채워짐
```
🗣️ **"말로만 하면 안 되니까 컨테이너 안의 설정 파일을 꺼내봤습니다. 빈칸이 실제 값으로 바뀌어 있습니다."**

**▶ [README 17-2절 · 다른 환경에서는](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1320-L1333)**
🗣️ **"제 컴퓨터에만 해당하는 부분은 다른 환경에서 뭘로 바꿔야 하는지까지 표로 적어놨습니다. 미션 제약사항이라서요."**

**📂 코드 위치**
[`templates/default.conf.template`](https://github.com/ellysuh22/1-homework/blob/main/templates/default.conf.template) — **빈칸(`${APP_PORT}`)이 들어있는 파일**
[`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) — `ARG`/`ENV`로 빈칸의 기본값 선언
[`scripts/runlog.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh) — 로그 수집 도구

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 포트가 뭐죠? | 컨테이너 **안팎을 잇는 문 번호**. `-p 8080:80` = 왼쪽 내 컴퓨터, 오른쪽 컨테이너 |
| 볼륨이 뭐죠? | 컨테이너 **밖에 둔 저장 공간**. `-v my-data:/data` = 볼륨명:컨테이너경로 |
| `-e`는? | **e**nvironment — 환경변수 주입 |
| 빈칸은 누가 채우나요? | 컨테이너가 켜질 때 **nginx가 자동으로** 채웁니다 |
| 왜 8090·3000을 비웠나요? | 나중에 뭘 더 띄워도 **충돌하지 않게** |
| 로그는 어떻게 남겼나요? | 명령어와 출력을 **같이 기록하는 도구**를 만들어 모든 실습을 그걸로 실행 |

---
---

# 항목 3 — 핵심 기술 원리

---

# 3-1. 이미지와 컨테이너의 차이를 "빌드/실행/변경" 관점에서 구분해 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **세 관점 각각으로 나눠서 말할 수 있는가.**
> → 뭉뚱그리면 안 됩니다. **빌드 / 실행 / 변경을 하나씩** 짚어야 합니다.

**① 한 줄 답**
> **이미지는 붕어빵 틀, 컨테이너는 붕어빵입니다. 틀은 빌드로 한 번 만들고 안 바뀌고, 붕어빵은 실행할 때마다 새로 찍힙니다.**

**② 자세히 — 세 관점**

| 관점 | 이미지 (틀) | 컨테이너 (붕어빵) |
|---|---|---|
| **빌드** | `docker build`로 **만든다** | 빌드로는 안 만들어짐 |
| **실행** | 혼자서는 못 돈다 | `docker run`으로 **찍혀 나온다** |
| **변경** | **못 고침 (읽기 전용)** | 고칠 수 있지만 **지우면 사라짐** |

**빌드 관점** — Dockerfile의 지시어 하나가 이미지의 **'층(layer)' 하나**를 만듭니다. 층은 캐시되니까, **자주 바뀌는 걸 뒤쪽에 둘수록** 재빌드가 빨라집니다.

**실행 관점** ⭐ — **이게 제일 중요합니다. 이미지 하나로 컨테이너를 여러 개 만들 수 있습니다.** 저는 `my-web:1.0` 하나로 8080·8081·8082 세 개를 동시에 띄웠습니다. 하나를 지워도 틀과 나머지는 멀쩡합니다.

**변경 관점** — 이미지는 읽기 전용이라 **컨테이너에서 파일을 고쳐도 이미지는 안 바뀝니다.** 그래서 **컨테이너를 지우면 그 변경분이 함께 사라집니다.** → 이게 **볼륨이 필요한 이유**로 이어집니다.

**③ 증빙 — 관점별로 하나씩**

**▶ [README 10-4절 · 빌드 — 이미지가 만들어진 순간](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L564-L582)**
```
$ docker build -t my-web:1.0 .
#8 naming to docker.io/library/my-web:1.0 done      ← 이미지 완성
```
🗣️ **"여기까지가 틀을 만든 겁니다. 아직 아무것도 안 돌아갑니다."**

**▶ [README 11-1절 · 실행 — 이미지 1개, 컨테이너 2개](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655)** ⭐
```
web-8081   0.0.0.0:8081->80/tcp   Up 5 seconds (healthy)
web-8080   0.0.0.0:8080->80/tcp   Up About a minute (healthy)
```
🗣️ **"이미지는 하나인데 컨테이너가 둘입니다. 하나를 지워도 틀과 나머지는 멀쩡합니다."**

**▶ [README 12장 · 변경 — 같은 이미지인데 한쪽만 바뀜](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L730-L761)**
```
8082 (밖에 연결)  :  v1  →  파일 고침  →  v2      ← 바뀜
8080 (이미지 안)  :  이미지 내장 (app/index.html)  ← 안 바뀜
```
🗣️ **"둘 다 같은 이미지로 띄웠는데 한쪽만 바뀌었습니다. 이미지 안에 있는 건 못 고친다는 뜻입니다."**

🗣️ **"그래서 컨테이너를 지우면 데이터가 사라지고, 데이터를 밖에 두는 볼륨이 필요해집니다."** ← **1-8번으로 자연스럽게 연결**

**📂 코드 위치**
[`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) — 틀을 만드는 레시피
[`logs/05-image-build.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/05-image-build.log) · [`logs/07-bind-mount.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/07-bind-mount.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| "변경 관점"이 뭘 묻는 건가요? | **만든 다음에 바꿀 수 있냐**는 것 |
| 이미지를 고치려면? | **다시 빌드**해야 합니다 |
| 컨테이너에서 고치면요? | 고쳐지지만 **컨테이너를 지우면 같이 사라집니다** |
| 그래서 어떻게 하나요? | **데이터를 밖에 둡니다. 그게 볼륨입니다** |
| 층(layer)이 뭐죠? | Dockerfile 명령 하나가 만드는 **한 겹**. 겹겹이 쌓여서 이미지가 됨 |

---

# 3-2. 컨테이너 내부 포트로 직접 접속할 수 없는 이유와, 포트 매핑이 필요한 이유를 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **질문이 두 개입니다.**
> ① **왜 직접 접속이 안 되는가** (격리)
> ② **왜 포트 매핑이 필요한가** (다리)
> → 둘을 나눠서 답해야 합니다.

**① 한 줄 답**
> **컨테이너가 격리된 공간이라서 그렇습니다. 자기만의 네트워크를 갖고 있어서, `-p`로 다리를 놓지 않으면 밖에서 닿을 수 없습니다.**

**② 자세히 — 둘로 나눠서**

**첫째 — 왜 직접 접속이 안 되나**
> 컨테이너는 **자기만의 네트워크**를 가집니다.
> **컨테이너 안의 `localhost`는 제 맥의 `localhost`가 아닙니다. 완전히 다른 것입니다.**
> 그래서 컨테이너 안에서 80번이 열려 있어도 밖에서는 안 보입니다.

**둘째 — 그럼 왜 포트 매핑이 필요한가**
> 격리는 **안전을 위해** 필요하지만, 그대로 두면 **아무도 못 쓰는 서버**가 됩니다.
> 그래서 **필요한 통로만 골라서 여는 방식**이 포트 매핑입니다.
> `-p 8080:80`은 **"내 컴퓨터 8080으로 오는 요청만 컨테이너 80으로 넘겨라"** 는 뜻입니다.
>
> **전부 여는 게 아니라 지정한 것만 여는 것** — 이게 포트 매핑을 쓰는 이유입니다.

**⚠️ 여기서 제일 많이 오해하는 것: `EXPOSE`는 다리가 아닙니다.**
> `EXPOSE 80`은 이미지에 **"이 포트를 씁니다"** 라고 적어둔 **문서**일 뿐입니다. 실제로 여는 건 **`-p`뿐**입니다.

**③ 증빙 — 제가 직접 증명했습니다**

**▶ [README 15-4절 · `-p` 없이 띄운 실험](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1015-L1035)** ⭐⭐ **이거 하나면 됩니다**
```
$ docker run -d --name web-noport my-web:1.0        # -p 없음

$ docker ps
web-noport   80/tcp   Up 2 seconds        # ← 호스트 포트가 없다

$ curl http://localhost:8082
curl: (7) Failed to connect                # ← 밖에서는 안 닿음

$ docker exec web-noport wget -O - http://127.0.0.1:80/env
APP_ENV=dev                                # ← 그런데 안에서는 잘 돈다
```
🗣️ **"밖에서는 실패, 안에서는 성공입니다. 서버는 멀쩡히 돌고 있는데 다리가 없어서 못 닿는 상황을 그대로 재현한 겁니다. PORTS 칸에 `0.0.0.0:...->`가 없는 것도 보이시죠. `EXPOSE 80`이 있는데도 안 열린 게 그 증거입니다."**

**▶ [README 11-4절 · 충돌하는 건 호스트 포트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L697-L708)**
```
Bind for 0.0.0.0:8080 failed: port is already allocated
```
🗣️ **"충돌하는 건 호스트 포트지 컨테이너 포트가 아닙니다. 세 컨테이너가 안쪽으로는 다 80번을 쓰는데 문제없습니다."**

**📂 코드 위치**
[`Dockerfile` 의 `EXPOSE` 부분](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile#L166-L189) — 주석에 "EXPOSE는 포트를 열어주지 않는다"고 적어놨습니다
[`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| "격리"가 뭐죠? | 컨테이너가 **자기만의 공간**을 갖는 것. 네트워크도 따로 |
| `-p`의 왼쪽/오른쪽? | **왼쪽 = 내 컴퓨터**, **오른쪽 = 컨테이너 안** |
| `docker exec ... wget`은? | **컨테이너 안에서** 자기 자신에게 접속해본 것 |
| `127.0.0.1`은? | **자기 자신**을 가리키는 주소 |
| `EXPOSE`는 그럼 왜 쓰나요? | **"이 포트를 씁니다"** 라고 적어두는 **문서 역할** |
| 격리가 왜 좋은 건가요? | 컨테이너끼리 서로 간섭 안 하고, **필요한 문만 골라서** 열 수 있어서 |

---

# 3-3. 절대 경로와 상대 경로를 어떤 상황에서 선택하는지 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **차이를 아는 것을 넘어, 언제 뭘 쓸지 판단할 수 있는가.**
> → 정의만 말하면 절반입니다. **선택 기준**을 말해야 합니다.

**① 한 줄 답**
> **실행 위치가 바뀔 수 있으면 절대 경로, 같은 폴더 안에서 짧게 쓸 땐 상대 경로를 씁니다.**

**② 자세히**

| | 절대 경로 | 상대 경로 |
|---|---|---|
| 생김새 | `/`부터 전부 | `.` `..`로 시작 |
| 기준 | **항상 루트** | **지금 있는 위치** |
| 비유 | **도로명 주소** | **"여기서 두 블록 직진"** |

> **도로명 주소**는 어디서 말해도 같은 곳을 가리킵니다.
> **"여기서 두 블록 직진"** 은 **내가 어디 서 있느냐에 따라 도착지가 달라집니다.**

**선택 기준은 딱 하나 — "실행 위치가 바뀔 수 있는가"**

| | 언제 쓰나 | 왜 |
|---|---|---|
| **절대 경로** | 스크립트 안, 설정 파일, 도커 마운트 경로 | **어디서 실행될지 모르니까** |
| **상대 경로** | 터미널에서 직접 칠 때, 프로젝트 안에서 옆 파일 가리킬 때 | **짧아서 편하니까** |

**③ 증빙 — 제가 직접 당해봤습니다**

**▶ [README 6-4절 · 위치만 바꿔서 같은 명령 실행](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L244-L250)** ⭐
```
$ cd /Users/ellysuh/Documents/1-homework/practice/docs   # 한 단계 아래로 이동

$ cat ./hello.txt
cat: ./hello.txt: No such file or directory              # ← 같은 명령인데 실패
```
🗣️ **"명령어는 글자 그대로 똑같은데, `.`이 가리키는 폴더가 바뀌어서 실패한 겁니다."**

**▶ [README 16-2절 · 실제로 로그가 통째로 날아간 사고](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1095-L1113)** ⭐
```
scripts/runlog.sh: line 38: logs/01-terminal.log: No such file or directory
```
🗣️ **"로그 파일 경로를 상대 경로로 썼다가, 스크립트가 `cd`로 하위 폴더에 들어간 순간 로그가 통째로 끊겼습니다. 그때 하던 실습이 하필 '절대 경로 vs 상대 경로 비교'였습니다."**

**📂 코드 위치**
[`scripts/runlog.sh` — 고친 부분](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh#L26-L30)
```bash
# LOGFILE 을 반드시 절대 경로로 바꾼다.
LOGFILE="$(cd "$(dirname "$LOGFILE")" && pwd)/$(basename "$LOGFILE")"
```
🗣️ **"이 두 줄이 그때 추가한 겁니다. 받은 경로를 무조건 절대 경로로 바꿔서 저장합니다."**

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `.`과 `..`는? | `.` = **지금 폴더**, `..` = **한 칸 위 폴더** |
| `./hello.txt`는? | **지금 이 폴더에 있는** hello.txt |
| 왜 같은 명령이 실패하나요? | 글자는 같지만 **`.`이 가리키는 곳이 달라져서** |
| 도커에서는 어떤가요? | 마운트 호스트 경로는 **반드시 절대 경로**여야 합니다. 그래서 `$(pwd)`를 써서 현재 위치를 절대 경로로 바꿔 넣었습니다 |
| `$(pwd)`가 뭐죠? | **지금 폴더의 절대 경로**를 그 자리에 넣어주는 것 |

---

# 3-4. 파일 권한 숫자 표기(755, 644)가 어떤 규칙으로 결정되는지 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **숫자가 어떻게 나오는지 계산 규칙을 아는가.**
> → 외운 값이 아니라 **"r=4, w=2, x=1을 더한다"** 는 규칙을 말해야 합니다.

**① 한 줄 답**
> **읽기 4, 쓰기 2, 실행 1로 놓고 가진 것만 더한 값을, 나·팀·그외 순서로 세 자리 늘어놓은 것입니다.**

**② 자세히 — 4단계로**

**1단계 — 권한은 3종류**

| 기호 | 점수 | 파일에서 | **폴더에서** |
|---|---|---|---|
| `r` (read) | **4** | 내용 읽기 | 목록 보기 |
| `w` (write) | **2** | 내용 수정 | 파일 생성/삭제 |
| `x` (execute) | **1** | 프로그램 실행 | **폴더 안에 들어가기** ⭐ |

**2단계 — 대상도 3그룹**: **나(소유자) / 팀(그룹) / 그 외 모든 사람**

**3단계 — 가진 것만 더합니다**

| 조합 | 계산 | 숫자 |
|---|---|---|
| `rwx` | 4+2+1 | **7** |
| `rw-` | 4+2+0 | **6** |
| `r-x` | 4+0+1 | **5** |
| `r--` | 4+0+0 | **4** |
| `---` | 0 | **0** |

**4단계 — 세 자리로 늘어놓습니다**

```
755 = rwx  r-x  r-x        644 = rw-  r--  r--
      ↑    ↑    ↑                ↑    ↑    ↑
      나   팀   그외             나   팀   그외
```

**왜 폴더는 755, 파일은 644인가** ⭐

> 핵심은 **폴더의 `x`가 '실행'이 아니라 '들어가기'** 라는 점입니다.
> 폴더에 `x`가 없으면 **문이 잠긴 것**이라 안에 못 들어갑니다.
>
> 그래서 **폴더는 `x`가 필요해서 755**, 일반 문서는 실행할 일이 없으니 **`x`를 뺀 644**를 씁니다.

**③ 증빙**

**▶ [README 15-2절 · `ls -l` 읽는 법](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L969-L985)**
```
-rwxr-xr-x
│└┬┘└┬┘└┬┘
│ │  │  └── 그 외(other):  r-x
│ │  └───── 팀(group):     r-x
│ └──────── 나(user):      rwx
└────────── 파일 종류 (- 파일 / d 디렉토리)
```
🗣️ **"앞 열 글자를 맨 앞 하나 떼고 3개씩 끊어 읽습니다."**

**▶ [README 15-2절 · 덧셈 규칙](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L986-L1000)**
```
rwx = 4+2+1 = 7        755 = rwx r-x r-x   ← 폴더·실행파일
rw- = 4+2   = 6        644 = rw- r-- r--   ← 일반 문서
```
🗣️ **"맨 아래에 디렉토리의 `x`는 '진입' 권한이라고 적어놨습니다. 이게 핵심입니다."**

**▶ [README 7-2절 · 실험으로 증명](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310)** ⭐
```
$ chmod 644 practice/perm-demo      # 폴더에서 x 제거
$ ls practice/perm-demo
ls: fts_read: Permission denied     # ← 못 들어감
```
🗣️ **"폴더에 644를 주면 통째로 먹통이 됩니다. 그래서 폴더는 644가 아니라 755를 쓰는 겁니다."**

**📂 코드 위치**
[`logs/02-permissions.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/02-permissions.log) · [`scripts/02-permissions.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/02-permissions.sh)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 3그룹이 누구죠? | **나(소유자) / 팀(그룹) / 그 외 모든 사람** |
| `staff`는? | 맥의 **기본 그룹 이름** |
| 주인은 무조건 되나요? | **아닙니다.** `chmod 000`이면 주인도 못 읽습니다 (root만 예외) |
| `x`가 파일과 폴더에서 다른 이유? | 폴더는 **실행할 게 없어서** '들어가기'로 쓰입니다 |
| 700은 뭔가요? | `rwx ------` — **나만 전부 가능, 나머지는 아무것도 못함** |

---
---

# 항목 4 — 심층 인터뷰

> **이 항목이 가장 중요합니다. 실제로 겪은 일**을 말해야 설득력이 있습니다.

---

# 4-1. "호스트 포트가 이미 사용 중"이라 포트 매핑이 실패한다면, 어떤 순서로 원인을 진단하겠는가?

**🔍 뭘 보는 질문인가**
> **문제를 만났을 때 순서대로 좁혀 나갈 수 있는가.**
> → 정답이 아니라 **진단 절차**를 묻습니다.

**① 한 줄 답**
> **에러 메시지 확인 → `docker ps`로 누가 쓰는지 찾기 → 도커 밖도 확인 → 끄거나 다른 포트 쓰기, 이 순서로 봅니다. 실제로 겪었습니다.**

**② 자세히 — 4단계**

| 순서 | 뭘 하나 | 왜 |
|---|---|---|
| **1** | **에러 메시지 읽기** | 어느 포트가 문제인지 **메시지가 알려줍니다** |
| **2** | **`docker ps`** | 다른 컨테이너가 쓰고 있는지 확인 |
| **3** | **`lsof -i :8080`** | 없으면 **도커 밖 프로그램**이 잡고 있는 것 |
| **4** | **끄거나, 다른 포트 쓰거나** | 상황에 따라 선택 |

**4단계에서 선택지는 두 가지입니다.**
> ① 그 포트를 쓰는 걸 **끄고 포트를 가져오거나**
> ② **비어 있는 다른 포트를 쓰거나**
>
> 저는 **②를 택했습니다.** 8080을 쓰던 컨테이너는 계속 필요했거든요.

**💡 여기서 핵심 포인트 하나 더** ⭐
> **충돌하는 건 호스트 포트(왼쪽 숫자)입니다.** `-p 8081:80`처럼 **왼쪽만 바꾸면 됩니다.**
> 오른쪽 80은 컨테이너가 여러 개 같이 써도 격리돼 있어 문제없습니다.
> **이걸 모르면 컨테이너 포트까지 바꾸려다 설정이 꼬입니다.**

**③ 증빙**

**▶ [README 16-3절 · 에러 발생](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1114-L1122)**
```
Bind for 0.0.0.0:8080 failed: port is already allocated
```
🗣️ **"`0.0.0.0:8080` — 호스트 쪽 8080이 문제라고 메시지가 직접 알려줍니다."**

**▶ [README 16-3절 · 누가 쓰는지 찾기](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1123-L1135)**
```
$ docker ps --format 'table {{.Names}}\t{{.Ports}}'
web-8080   0.0.0.0:8080->80/tcp
```
🗣️ **"`web-8080`이 쓰고 있었습니다. 도커 안에서 바로 찾았습니다."**

**▶ [README 16-3절 · 해결](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1136-L1142)**
```
$ docker run -d -p 8081:80 --name web-8081 my-web:1.0     # 성공
```
🗣️ **"8081로 바꿔서 해결했습니다. 왼쪽 숫자만 바꿨습니다."**

**📂 코드 위치**
[`logs/06-port-mapping.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/06-port-mapping.log)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| `lsof`는? | **L**i**s**t **O**pen **F**iles — 열려 있는 것 목록. `lsof -i :8080`으로 포트 점유자 확인 |
| 왜 도커 밖도 보나요? | `docker ps`에 없으면 **도커가 아닌 다른 프로그램**이 잡고 있는 것 |
| 실패한 컨테이너는요? | `Created` 상태로 남습니다. `docker rm -f`로 치워야 이름이 안 겹칩니다 |
| 미리 막을 방법은? | **용도별로 포트 대역을 갈라두는 것.** 저는 8080·8081·8082만 쓰고 8090·3000은 비워뒀습니다 |

---

# 4-2. 컨테이너 삭제 후 데이터가 사라진 경험이 있다면, 이를 방지하기 위한 대안을 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> ① **왜 사라지는지** 원리를 아는가
> ② **대안**을 아는가 (볼륨 / 바인드 마운트)
> → **"볼륨 쓰면 됩니다"** 만으로는 부족하고, **왜 사라지는지**부터 말해야 합니다.

**① 한 줄 답**
> **네, 있습니다. 원인을 확인하려고 일부러 다시 재현해봤고, 대안은 볼륨입니다.**

**② 자세히**

**왜 사라지나**
> 컨테이너에 쓴 파일은 **그 컨테이너 전용 저장 층**에 저장됩니다.
> **컨테이너를 지우면 그 층도 함께 지워지므로** 데이터가 같이 사라집니다.
> 이미지는 읽기 전용이라 변경분을 받아주지 않습니다.

**대안은 두 가지인데 용도가 다릅니다**

| | 바인드 마운트 | 볼륨 |
|---|---|---|
| **뭘 연결하나** | 내가 지정한 **내 컴퓨터 폴더** | 도커가 관리하는 **전용 저장소** |
| **비유** | 내 책상 서랍을 그대로 씀 | **밖에 빌린 사물함** |
| **주 용도** | **개발 중 코드 즉시 반영** | **운영 데이터 영구 보관** |
| **이식성** | 경로에 의존 (다른 PC에서 깨질 수 있음) | 이름으로 관리돼 **이식성 좋음** |
| **확인법** | `docker inspect` → `Type=bind` | `docker inspect` → `Type=volume` |

> **운영 데이터(회원 정보, 업로드 파일)는 볼륨**, **개발 중 소스코드는 바인드 마운트**가 맞습니다.

**③ 증빙 — 사라지는 것부터 재현했습니다**

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
🗣️ **"같은 절차인데 볼륨을 쓴 쪽은 시각까지 그대로 남았습니다. 두 실험의 차이는 볼륨 연결 여부 하나뿐입니다."**

**▶ [README 12-2절 · 바인드 마운트는 즉시 반영](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L744-L752)**
```
    <p class="ver">v2</p>        # ← 재빌드 없이 즉시 반영됨
```
🗣️ **"바인드 마운트는 개발용입니다. 제 컴퓨터에서 파일을 고치면 재빌드도 재시작도 없이 바로 반영됩니다."**

**📂 코드 위치**
[`logs/08-volume.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/08-volume.log) · [`logs/07-bind-mount.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/07-bind-mount.log)
[`bindmount-demo/index.html`](https://github.com/ellysuh22/1-homework/blob/main/bindmount-demo/index.html) — 마운트 실습에 쓴 페이지 (지금은 `v2` 상태)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 볼륨과 마운트 차이? | **볼륨 = 도커가 관리하는 창고**, **마운트 = 내 컴퓨터 폴더 직접 연결** |
| 연결됐는지 확인은? | `docker inspect` → `Type=volume` / `Type=bind` |
| 볼륨 목록은? | `docker volume ls` |
| 왜 대조군을 만들었나요? | 볼륨만 보여주면 **"원래 안 지워지는 것 아니냐"** 는 의문이 남아서 |
| 볼륨은 실제로 어디 있나요? | 도커가 관리하는 영역입니다. **경로를 몰라도 이름으로 쓰는 게 장점**입니다 |

---

# 4-3. 이 미션에서 가장 어려웠던 지점과 해결 과정(가설 → 확인 → 조치)을 근거와 함께 설명할 수 있는가?

**🔍 뭘 보는 질문인가**
> **문제를 만났을 때 어떻게 접근하는 사람인가.**
> 형식이 정해져 있습니다 — **가설 → 확인 → 조치**, 그리고 **근거**
> → 감상이 아니라 **절차**로 말해야 합니다.

**① 한 줄 답**
> **GitHub 업로드가 두 번 연속 다른 이유로 막힌 것이 가장 어려웠습니다. 로컬은 멀쩡한데 원격에서만 막혀서요.**

**② 자세히 — 가설 → 확인 → 조치**

---

## 1차 — 계정 권한 문제

**문제**
> 로컬 원격 주소는 `ellysuh22/1-homework`인데, GitHub CLI는 **`ellysuh22-22`라는 다른 계정**으로 로그인돼 있었습니다.

**가설**
> 계정이 두 개인데, **인증된 계정이 저장소 주인이 아니라서 쓰기 권한이 없을 것이다.**

**확인** ⭐
> **push를 시도해 실패를 보기 전에**, API로 현재 계정의 권한을 직접 조회했습니다.

**▶ [README 16-1절 · 가설 → 확인](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1073-L1094)**
```
$ gh api repos/ellysuh22/1-homework --jq '.permissions'
{"admin":false, ... "push":false, ...}      ← 가설이 사실로 확인
```
🗣️ **"`push: false` — 가설이 맞았습니다. 무작정 push해서 실패를 보는 것보다 이게 빨랐습니다."**

**조치**
> 저장소 주인 계정으로 **재인증**했습니다.
> (다른 방법으로 새 저장소를 만들어 remote를 바꾸는 것도 있었지만, **이미 만들어둔 제출용 저장소를 그대로 쓰려고** 재인증을 택했습니다.)

---

## 2차 — 이메일 프라이버시 정책

**문제**
> 권한을 해결하고 push했더니 **또** 거부됐습니다.

**▶ [README 16-4절 · 두 번째 거부](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1143-L1179)**
```
remote: error: GH007: Your push would publish a private email address.
! [remote rejected] main -> main (push declined due to email privacy restrictions)
```

**가설**
> 이번엔 권한이 아니라 **정책 문제**로 보였습니다. 커밋에 실제 이메일이 들어있는데, 계정에 **"이메일을 노출하는 push 차단" 옵션**이 켜져 있어서 GitHub이 대신 막아준 것으로 추정했습니다.

**확인**
```
$ git log -1 --format='%an <%ae>'
ellysuh22 <youngsuh0630@gmail.com>        ← 실제 이메일이 들어있음
```
에러가 안내한 설정 페이지에서 **차단 옵션이 켜져 있는 것**도 확인했습니다.

**조치**
> 선택지가 둘이었습니다.
> ① GitHub이 주는 noreply 이메일로 바꾸고 **히스토리 재작성**
> ② **차단 옵션 해제**
>
> **②를 택했습니다.** ①은 이미 만든 커밋을 전부 다시 쓰는 거라 위험이 컸습니다.

**▶ [README 14-3절 · 해결 후](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L893-L894)**
```
{"admin":true, ... "push":true, ...}      ← 해결 후
```
🗣️ **"아까 `push: false`와 비교하면 바뀐 게 보입니다."**

---

**③ 증빙 — 한눈에**

| 순서 | 열 곳 | 보이는 것 |
|---|---|---|
| 1차 확인 | [README 16-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1073-L1094) | `"push": false` — 가설이 사실로 확인 |
| 2차 거부 | [README 16-4절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1143-L1179) | `GH007: Your push would publish a private email address` |
| 해결 후 | [README 14-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L893-L894) | `"push": true` — 1차와 비교하면 바뀐 게 보임 |

**④ 이 경험에서 배운 것 — 세 가지**

**첫째, Git과 GitHub은 완전히 별개입니다.** ⭐
> 두 번 다 **로컬 Git에는 아무 문제가 없었습니다.** 커밋도 정상이고 기록도 멀쩡했습니다.
> 막힌 건 전부 원격 쪽 — **권한과 정책**이었습니다.
> 이걸 겪고 나니 "Git은 로컬 버전관리, GitHub은 원격 협업 플랫폼"이라는 설명이 확실히 와닿았습니다.

**둘째, 커밋 이메일은 시작 전에 정해야 합니다.**
> 커밋을 만든 뒤에 바꾸려면 히스토리 재작성이 필요합니다. 공개 저장소에 실제 이메일을 남기기 싫다면 **처음부터** noreply 주소로 설정하는 게 맞습니다.

**셋째, 에러를 만나기 전에 확인하는 습관이 생겼습니다.**
> 1차 때 무작정 push해서 실패를 봤다면 원인 파악에 시간이 더 걸렸을 겁니다. `gh api`로 권한을 먼저 조회하니 한 번에 확인됐습니다.

**📂 코드 위치**
[`logs/09-git-github.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/09-git-github.log)
[README 16장 — 트러블슈팅 7건 전체](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1071-L1262)

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 왜 push 전에 권한을 봤나요? | 실패를 겪고 원인을 찾는 것보다 **먼저 확인하는 게 빠릅니다** |
| `gh`는? | **G**it**H**ub CLI — 터미널에서 GitHub을 다루는 도구 |
| 트러블슈팅이 몇 건인가요? | README 16장에 **7건** 정리돼 있습니다 (미션 요구는 2건 이상) |
| 히스토리 재작성이 뭐죠? | 이미 만든 커밋을 **전부 다시 쓰는 것**. 위험해서 피했습니다 |

---

### 💬 다르게 물어보면

| 질문 | 답 | 열 곳 |
|---|---|---|
| **"용어는 안 어려웠나요?"** | "제일 어려웠습니다. 명령어를 **원래 영어 단어**로 이해했더니 풀렸습니다. `-p`는 publish, `-d`는 detached, `ps`는 process status. 그러니까 **왜 이 옵션을 붙이는지**가 보였습니다." | [부록 D](#부록-d--약어-사전-되물으면) |
| **"기술적으로 까다로웠던 건?"** | "`docker run -it`으로 컨테이너에 들어간 세션을 **로그로 남기는 것**이었습니다. `-it`은 가상 터미널을 요구해서 파일에 안 담깁니다. 맥 내장 `script` 명령으로 가상 터미널을 만들어 해결했습니다." | [9-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L421-L446) |
| **"어이없는 실수는?"** | "로그 경로를 **상대 경로**로 써서 `cd` 이후 로그가 통째로 날아간 일입니다. 그때 하던 실습이 하필 '절대 경로 vs 상대 경로 비교'였습니다." | [16-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1095-L1113) |
| **"스크린샷은 왜 안 됐나?"** | "맥 화면 기록 권한 문제였습니다. 프로세스를 추적해 **대상이 VS Code**인 걸 찾아 해결했습니다." | [16-5절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1180-L1207) |
| **"`attach`와 `exec` 차이는?"** | "`exec`는 **문을 하나 더 내는 것**(나와도 컨테이너 살아있음), `attach`는 **같은 화면에 붙는 것**(`Ctrl+C`면 같이 죽음, 코드 130)." | [9-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L447-L503) |

---
---

# 보너스 — 수행했는가?

**🔍 뭘 보는 질문인가**
> **선택 과제를 했는가.** 다섯 개 중 몇 개든 하면 크레딧입니다.

**① 한 줄 답**
> **다섯 개 중 GitHub SSH 키 설정 하나를 했습니다. 대조 실험까지 붙여서 깊이 있게 했습니다.**

**② 자세히**

> 키를 만들어 GitHub에 등록하고, **HTTPS에서 SSH로 전환**해서 실제 push까지 했습니다.
>
> 여기서 한 가지 더 했습니다. **성공만 보여주면 원래 열려 있던 문인지 구별이 안 됩니다.**
> 그래서 **키를 차단하면 거부되는지**까지 확인해서 나란히 놓았습니다.

| 실험 | 뭘 했나 | 결과 |
|---|---|---|
| **A** | 키가 있을 때 인증 | 성공 |
| **B** | 키를 차단하고 인증 | **거부됨** ← 대조군 |
| **C** | HTTPS → SSH 전환 | 원격 주소 바뀜 |
| **D** | SSH 경로로 실제 push | 성공 |

**③ 증빙**

**▶ [README 3-2절 · 보너스 체크리스트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L61-L71)**
```
- [x] GitHub SSH 키 설정 — 키 등록 + 인증 동작 확인 + HTTPS→SSH 전환
```
🗣️ **"다섯 개 중 이것 하나를 수행했습니다."**

**▶ [README 19장 · SSH 키 전체](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1391-L1400)** ⭐
🗣️ **"19장에 실험 A부터 D까지 정리돼 있습니다."**

**▶ [README 17-3절 · 확장을 고려한 설계](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1334-L1349)**
🗣️ **"보너스를 나중에 붙여도 기존 산출물을 안 고쳐도 되게 설계했는데, 실제로 SSH를 추가할 때 기존 6~18장은 한 줄도 안 고쳤습니다."**

**📂 코드 위치**
[`scripts/10-ssh-key.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/10-ssh-key.sh) · [`logs/10-ssh-key.log`](https://github.com/ellysuh22/1-homework/blob/main/logs/10-ssh-key.log)
[`evidence/github-ssh-key.png`](https://github.com/ellysuh22/1-homework/blob/main/evidence/github-ssh-key.png) — 등록 화면

**💡 되물으면**

| 물음 | 답 |
|---|---|
| 나머지 네 개는? | Compose 3개와 환경변수는 **이번 제출엔 없습니다** |
| 환경변수는 이미 한 것 아닌가요? | **기본 과제에서 구조는 만들어뒀습니다.** `ARG/ENV APP_PORT`가 Dockerfile에 있고 치환도 검증했습니다. 보너스 항목으로 따로 정리를 안 했을 뿐입니다 |
| SSH가 HTTPS보다 뭐가 나은가요? | 매번 토큰을 안 넣어도 되고, **키 기반이라 관리가 편합니다** |
| **"개인키가 노출되진 않았나요?"** ⚠️ | **"아닙니다. 저장소에는 공개키와 지문만 있습니다.** 실제로 검사해서 [README 18-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1358-L1378)에 결과를 적어놨습니다. **다만 passphrase는 안 걸었고, 그 한계도 문서에 명시했습니다.**" |

---
---

# 부록 A — 문항별 "이거 하나만 보여줘도 됨"

> 시간이 없거나 말이 꼬이면 **이 링크 하나만 열고 한 문장 말하면 됩니다.**

| 번호 | 문항 | 열 곳 | 할 말 |
|---|---|---|---|
| **1-1** | 터미널 9종 | [6-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L198-L218) | "`mv`를 이름변경·이동 두 경우로 나눠 실행했습니다" |
| **1-2** | 권한 변경 | [7-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L293-L295) | "제 파일인데도 `Permission denied`입니다" |
| **1-3** | Docker 동작 | [8-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L324-L344) | "이 `Server:` 줄이 엔진이 살아있다는 증거입니다" |
| **1-4** | hello-world | [9-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L403-L420) | "1~4번이 도커 동작 순서입니다" |
| **1-5** | 목록·정리 | [8-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L371-L398) | "`ps`는 돌아가는 것, `ps -a`는 끝난 것까지" |
| **1-6** | 이미지 빌드 | [10-5절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L603-L612) | "헬스체크가 `starting→healthy`로 바뀝니다" |
| **1-7** | 포트 접속 | [11-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696) | "주소창과 화면이 같이 보입니다" |
| **1-8** | 볼륨 영속성 | [13-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L807-L812) | "다른 컨테이너인데 시각이 똑같습니다" |
| **1-9** | Git/GitHub | [저장소](https://github.com/ellysuh22/1-homework) | "올린 파일과 커밋이 전부 여기 있습니다" |
| **2-1** | 구조 기준 | [5장](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L101-L128) | "이미지에 들어갈 것과 아닌 것으로 나눴습니다" |
| **2-2** | 재현성 | [17-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319) | "clone 하고 이대로 치시면 재현됩니다" |
| **3-1** | 이미지 vs 컨테이너 | [11-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L642-L655) | "이미지 하나로 컨테이너 둘입니다" |
| **3-2** | 포트 매핑 | [15-4절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1015-L1035) | "밖에선 실패, 안에선 성공입니다" |
| **3-3** | 절대/상대 경로 | [6-4절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L244-L250) | "같은 명령인데 위치가 바뀌니 실패합니다" |
| **3-4** | 755/644 | [7-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L305-L310) | "폴더에서 `x`를 빼니 못 들어갑니다" |
| **4-1** | 포트 충돌 | [16-3절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1114-L1142) | "왼쪽 숫자만 바꿔서 해결했습니다" |
| **4-2** | 데이터 소실 | [13-2절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L815-L832) | "볼륨 없는 쪽은 깨끗하게 사라졌습니다" |
| **4-3** | 최대 난관 | [16-1절](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1073-L1094) | "`push: false` — 가설을 API로 먼저 확인했습니다" |
| **보너스** | SSH 키 | [19장](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1391-L1400) | "대조 실험까지 붙였습니다" |

---

# 부록 B — "뭐 했는지 보여주세요"로 시작할 때

**🗣️ 여는 말**
> **"네, README 하나만 보시면 전체가 파악되도록 만들었습니다. 순서대로 보여드리겠습니다."**

| 순서 | 열 곳 | 할 말 |
|---|---|---|
| 1 | [4장 검증표](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L73-L99) | "검증 항목 / 명령 / 기대 결과 / 증거를 한 표로 묶었습니다" |
| 2 | [3-1절 체크리스트](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L49-L60) | "필수 아홉 개가 전부 체크돼 있습니다" |
| 3 | [11-3절 브라우저](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L683-L696) | "주소창이 보이는 캡처입니다" |
| 4 | [13장 볼륨](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L764-L833) | "볼륨은 대조군까지 놓고 증명했습니다" |
| 5 | [16장 트러블슈팅](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1071-L1262) | "막힌 것들을 가설→확인→조치로 정리했습니다. 요구는 2건인데 7건입니다" |
| 6 | [17-1절 재현](https://github.com/ellysuh22/1-homework/blob/main/README.md?plain=1#L1265-L1319) | "clone 하고 이대로 치시면 재현됩니다" |

---

# 부록 C — "코드 보여주세요"라고 하면

**🗣️ 여는 말 (이걸 먼저 말해야 안 당황합니다)**
> **"이 미션의 코드는 프로그램이 아니라 '환경을 만드는 코드'입니다. 네 가지가 있는데, 이미지 레시피인 Dockerfile, 서버 설정 템플릿, 웹페이지, 그리고 제가 만든 로그 수집 도구입니다. Dockerfile부터 보여드리겠습니다."**

| 순서 | 파일 | 할 말 | 비중 |
|---|---|---|---|
| **1** | [`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) | "완성된 nginx를 가져와서 제 것 여섯 가지를 얹었습니다" | **70%** |
| **2** | [`templates/default.conf.template`](https://github.com/ellysuh22/1-homework/blob/main/templates/default.conf.template) | "아까 말한 빈칸이 이겁니다. 켜질 때 실제 값으로 채워집니다" | 20% |
| **3** | [`app/index.html`](https://github.com/ellysuh22/1-homework/blob/main/app/index.html) | "페이지에 '이미지 내장'이라고 표시해뒀습니다" | 5% |
| **4** | [`scripts/runlog.sh`](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh) | "미션이 시켜서가 아니라 제가 필요해서 만든 도구입니다" | 5% |

**⚠️ Dockerfile을 그냥 열면 안 됩니다 — 263줄 중 249줄이 주석입니다**

터미널에 이걸 쳐서 **알맹이 14줄만** 띄우세요:

```bash
grep -vE '^\s*#|^\s*$' Dockerfile
```

🗣️ **"주석을 걷어내면 14줄입니다. 주석이 긴 건 의도한 건데, 지시어마다 '왜 이걸 썼는지'를 적어놨습니다."**

**runlog.sh에는 꺼낼 카드가 두 개 있습니다**

| 고친 곳 | 무슨 일이 있었나 |
|---|---|
| [절대경로 변환](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh#L26-L30) | 상대경로로 뒀더니 `cd` 하는 순간 **로그가 통째로 날아갔습니다** |
| [따옴표 복원](https://github.com/ellysuh22/1-homework/blob/main/scripts/runlog.sh#L41-L50) | 따옴표가 사라져서 **로그를 보고 따라 치면 다른 명령**이 됐습니다 |

🗣️ **"두 번 다 재현성이 깨지는 문제라 고쳤습니다. 지금 로그는 복사해서 붙이면 그대로 실행됩니다."**

**"이게 다예요?" 라고 하면**
> 🗣️ **"네. 이 미션은 (A) 방식 — 완성된 웹서버 이미지에 콘텐츠와 설정만 교체하는 방식이라 서버를 직접 짜지 않습니다. 대신 왜 이렇게 구성했는지를 주석과 README에 남겼습니다."**

**"직접 짠 거 맞나요?" 라고 하면**
> [Dockerfile의 `CMD를 적지 않은 이유` 부분](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile#L241-L263)을 여세요.
> 🗣️ **"`CMD`를 덮어쓰면 템플릿 치환이 통째로 건너뛰어지는데, 에러가 전혀 안 납니다. 컨테이너는 멀쩡히 뜨고 포트만 안 바뀌어요. 직접 겪어서 주석에 경고로 남겨뒀습니다."**

---

# 부록 D — 약어 사전 (되물으면)

> **명령어는 대부분 영어 줄임말입니다.** 뜻을 알면 왜 그 옵션을 붙이는지가 보입니다.

| 약어 | 원래 말 | 뜻 |
|---|---|---|
| `pwd` | **P**rint **W**orking **D**irectory | 지금 폴더 찍기 |
| `ls` / `-l` / `-a` | **l**ist / **l**ong / **a**ll | 목록 / 자세히 / 숨김까지 |
| `cd` | **C**hange **D**irectory | 폴더 이동 (`..` = 한 칸 위, `.` = 지금) |
| `mkdir` | **M**a**k**e **Dir**ectory | 폴더 만들기 |
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
| `exec` / `attach` | execute / attach | **문을 하나 더 냄** / **같은 화면에 붙음** |
| `EXPOSE` | expose | **"이 포트 씁니다" 문서** — 실제로 열진 않음 |
| `FROM` | from | **어느 이미지에서 시작할지** |
| `COPY` | copy | 내 파일을 이미지 안으로 |
| `ARG` / `ENV` | argument / environment | **빌드할 때만** / **실행할 때까지** 사는 변수 |
| `origin` | origin | 원격 저장소의 **기본 별명** |
| `gh` | **G**it**H**ub CLI | 터미널용 GitHub 도구 |
| `Up 5 seconds` | — | 살아있고 켠 지 5초 |
| `Exited (137)` | 128+9 | **강제 종료**로 죽음 |
| `Exited (130)` | 128+2 | **`Ctrl+C`** 로 죽음 |
| `200 OK` | — | 정상 응답 |
| `alpine` | Alpine Linux | **용량을 확 줄인 리눅스** |

---

**함께 열어둘 파일**
[`README.md`](https://github.com/ellysuh22/1-homework/blob/main/README.md) — 수행 로그 원본
[`REPORT.md`](https://github.com/ellysuh22/1-homework/blob/main/REPORT.md) — 설계 판단 근거
[`EXPLAIN.md`](https://github.com/ellysuh22/1-homework/blob/main/EXPLAIN.md) — 쉬운 개념 설명
[`Dockerfile`](https://github.com/ellysuh22/1-homework/blob/main/Dockerfile) — "코드 보여주세요" 대비
