#!/bin/bash

# 각 submodule의 branch 세팅
function checkout_branch() {
  branchName=$1
  echo ">> Checkout branch to $branchName <<"
  git checkout $branchName
  git submodule foreach git checkout $branchName
}

function fetch() {
  echo ">> Fetch source for main module <<"
  git fetch -p

  echo ">> Fetch source for sub modules <<"
  git submodule foreach git fetch -p
}

function pull() {
  echo ">> Pull source for main module <<"
  git pull

  echo ">> Pull source for sub modules <<"
  git submodule foreach git pull
}

function install_node_modules() {
  echo ">> Install node modules <<"
  git submodule foreach yarn
}

function run_update() {
  checkout_branch "$1"
  fetch # 최신 소스 확인
  pull # 최신 소스 가져오기
  install_node_modules # Node 패키지 설치
}

# 메뉴 출력
function menu()
{
  PS3="최신 소스를 가져올 Branch를 선택하세요 > "
  COLUMNS=30
  options=("Main branch" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "Main branch" )     run_update main;    break;;
          "Quit" )            exit;;
      esac
  done
}

menu
