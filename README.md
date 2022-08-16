## Evmos Hackerton StayKing Finance (Defi)

# Tookit 설치

- git

```sh
brew install git
```

- docker : [Install Guide](https://docs.docker.com/desktop/mac/install/)

# Github SSH 키 등록

- 소스코드 Clone 시 ID, P/W 입력 없이 사용하려면 머신의 SSH 키를 Github에 등록해 주어야 한다.

## Local의 SSH 키 발급 받기

- SSH 키 발급 시 passphrase 를 입력하라고 할 때 Enter 치고 넘어가면 매번 비밀번호를 입력하지 않아도 된다.

```
ssh-keygen
# Enter 3번 입력
```

## SSH 키 확인

- 아래 명령 실행 후 나오는 `ssh-rsa` 부터 끝까지 복사

```
cat ~/.ssh/id_rsa.pub
```

## SSH 키 등록하기

- [설정 페이지로 이동](https://github.com/settings/keys)
- New SSH Key
- Title : 본인이 식별할 수 있는 이름 이름 지정
- Key : 위에서 복사한 SSH 키 붙여넣기

# 소스코드 내려받기

```
git clone --recursive git@github.com:evmos-stayking-house/stayking-finance.git
```

# 처음 시작 시 실행 스크립트

- 환경 변수 파일 복사 및 서브 모듈 초기화

```sh
./init.sh
```

# 서비스 시작하기

## 도커 컨테이너 시작

```sh
./start.sh
```

## 옵션
- [Local Mode]
    - env.local 설정 Load
- [Dev Mode]
    - env.dev 설정 Load
- [Prod Mode]
    - env.prod 설정 Load
      
- Quit : 종료

# 서비스 종료하기

## 도커 컨테이너 시작

- control + c 를 눌러서 명령 줄로 이동한 후 아래 명령 실행

```sh
./stop.sh
```

## 옵션

- Kill & Remove : 현재 실행 중인 컨테이너 종료 및 삭제
- Remove Images : 현재 실행 중인 컨테이너 종료 및 삭제. 그리고 다운 받은 모든 이미지 삭제
- Prune : 현재 중지 된 모든 컨테이너, 사용 안하는 이미지, 네트워크, 볼륨 그리고 빌드 캐시 삭제
- Quit : 아무것도 안 함

# 작업 중간에 최신 소스로 업데이트

- github 세팅이 안되어 있는 경우 수동으로 입력해야 됨

```sh
./update.sh
```

# 폴더 구조

## compose

- Docker Compose 설정 파일

## data

- Docker Volume 데이터 (ex: MongoDB)

## docker

- SubModule 이 외의 Docker 설정 파일 (ex: MongoDB)

## docs

- 문서화 된 프로젝트 구조

## submodules

- 개별 서비스 Repository

## 환경 변수

- .env.prod : 운영 서버 환경 변수
- .env.dev : 개발 서버 환경 변수
- .env.local : 로컬 서버 환경 변수

## 실행 스크립트

- init.sh : 초기 세팅 스크립트
- start.sh : Docker 시작 스크립트
- stop.sh : Docker 종료 스크립트
- update.sh : 모든 Submodule을 최신 소스로 업데이트

# Submodule 관리

## 등록

```
git submodule add -b main git@github.com:evmos-stayking-house/web-client.git submodules/web-client

git submodule add -b main git@github.com:evmos-stayking-house/scheduled-worker-golang.git submodules/scheduled-worker-golang

git submodule add -b main git@github.com:evmos-stayking-house/defi-contract.git submodules/defi-contract

git submodule add -b main git@github.com:evmos-stayking-house/scheduled-worker.git submodules/scheduled-worker
```

## 삭제

```
git submodule deinit -f <path/to/submodule>

rm -rf .git/modules/<path/to/submodule>

git rm -f <path/to/submodule>
```
