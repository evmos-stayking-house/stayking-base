#!/bin/bash

CMD="docker-compose \
  -p evmos-stayking-house \
  -f compose/compose.mongo.yml \
  -f compose/compose.web-interface.yml"

function build()
{
  echo "##### Docker Compose Build #####"
  eval "$CMD" --profile "$1" --env-file "$2" build
}

function run()
{
  echo "##### Docker Compose Run #####"
  eval "$CMD" --profile "$1" --env-file "$2" up --remove-orphans
}

function menu()
{
  PS3="빌드와 실행 방식을 선택하세요 > "
  COLUMNS=30
  options=("Build and Run" "Run" "Quit")
  select yn in "${options[@]}"; do
      case $yn in
          "Build and Run" ) build "$1" "$2"; run "$1" "$2"; break;;
          "Run" )           run   "$1" "$2"; break;;
          "Quit" )          exit;;
      esac
  done
}

echo
PS3="실행할 환경을 선택하세요 > "
COLUMNS=30
options=(
  "[Local Mode]"
  "[Dev Mode]"
  "[Prod Mode]"
  "Quit"
)
select yn in "${options[@]}"; do
    case $yn in
        "[Local Mode]" )       menu  "local" ".env.local";  break;;
        "[Dev Mode]")          menu  "dev" ".env.dev";  break;;
        "[Prod Mode]")         menu  "prod" ".env.prod";  break;;
        "Quit" )                     exit;;
    esac
done
