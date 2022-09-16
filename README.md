## 2022 EVMOS Hackathon StayKing House (DeFi)

---
Evmos StayKing House is the largest lending protocol allowing leveraged staking on Cosmos and EVMOS Chain.
It helps lenders earn safe and stable yields, and offers borrowers loans for leveraged yield staking positions, vastly multiplying their staking principals and resulting profits.


## Our Service

---
  https://evmos.stayking.xyz
![img.png](img.png)

## Modules

---
  - [stayking-finance](https://github.com/evmos-stayking-house/stayking-finance) (root) : This repo is the root repository to execute entire modules with docker-compose

    - [web-client](https://github.com/evmos-stayking-house/web-client) : This submodule repo is the web service to interact with various contracts on EVMOS chain 
    - [defi-contract](https://docs.docker.com/desktop/mac/install/) : This submodule repo is the DeFi contracts developed by solidity language
    - [scheduled-worker]() : The purpose of this repository is to run a liquidation bot every minute
    - [scheduled-worker-golang]() : The purpose of this repository is to subscribe to events in the Cosmos and EVMOS chains to handle certain functions such as auto compound, contract function call, etc


## Getting Started

---
It will copy environment variable file and initialize submodules on your machine

```sh
./init.sh
```

Docker must be pre-installed to run the script below

```sh
./start.sh
```

### Env Option
- [Local Mode]
    - Load local environment variables ( Local-Net )
    - hardhat node must be run in this mode. check submodules/defi-contract repository first
- [Dev Mode]
    - Load development environment variables ( Test-Net: evmos_9000-4 )

- [Prod Mode]
    - Not Used yet
      
- Quit

## Termination of Service

---
Press control + c to go to the command line and execute the command below 

```sh
./stop.sh
```

### Options

- Kill & Remove : 현재 실행 중인 컨테이너 종료 및 삭제
- Remove Images : 현재 실행 중인 컨테이너 종료 및 삭제. 그리고 다운 받은 모든 이미지 삭제
- Prune : 현재 중지 된 모든 컨테이너, 사용 안하는 이미지, 네트워크, 볼륨 그리고 빌드 캐시 삭제
- Quit : 아무것도 안 함

### Update to the latest source
Must be entered manually if github is not set
```sh
./update.sh
```

## Folder Structure

---
 - **compose**
   - docker-compose configuration files

 - **data**
   - docker volume data files

 - **docker**
   - docker settings file excluding submodule

 - **docs**
   - documentation materials

 - **submodules**
    - an independent service module repository

## Git Submodule management

---
### register git submodules

```
git submodule add -b main git@github.com:evmos-stayking-house/web-client.git submodules/web-client

git submodule add -b main git@github.com:evmos-stayking-house/scheduled-worker-golang.git submodules/scheduled-worker-golang

git submodule add -b main git@github.com:evmos-stayking-house/defi-contract.git submodules/defi-contract

git submodule add -b main git@github.com:evmos-stayking-house/scheduled-worker.git submodules/scheduled-worker
```

### unregister git submodules

```
git submodule deinit -f <path/to/submodule>

rm -rf .git/modules/<path/to/submodule>

git rm -f <path/to/submodule>
```
