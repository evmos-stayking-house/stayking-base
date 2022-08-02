#!/bin/bash

function copy_envfiles_and_directories () {
  cp .env.example .env.local
  cp .env.example .env.dev
  cp .env.example .env.prod
  mkdir -pv data/mongo
}

# Git submodule 초기화
function init_and_update_submodules() {
  echo ">> Initialize and update fairy repository submodules <<"
  git submodule init && git submodule update
}

# 각 submodule 의  branch 세팅
function checkout_branch() {
  branchName=$1
  echo ">> Checkout branch to $branchName <<"
  git submodule foreach git checkout $branchName
}

# 각 submodule 의 node 패키지 설치
function install_node_modules() {
  echo ">> Install node modules <<"
  git submodule foreach yarn
}

# 실행
function run_init()
{
  copy_envfiles_and_directories # env file 복사
  init_and_update_submodules # submodule 초기화 및 소스 업데이트
  checkout_branch "main" # develop/main 브랜치로 변경
  install_node_modules # node modules 설치
}

run_init;
