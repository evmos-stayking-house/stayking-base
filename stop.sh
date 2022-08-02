#!/bin/bash

PROJECT_NAME=evmos-stayking-house

function stop()
{
  P1=$(docker ps -q)
  if [ "${P1}" != "" ]; then
    echo "Killing all running containers"  &2> /dev/null
    docker kill ${P1}
  fi

  P2=$(docker ps -aq)
  if [ "${P2}" != "" ]; then
    echo "Removing all containers"  &2> /dev/null
    docker rm ${P2} -f
  fi
}

# Function to remove the images as well
function remove()
{
  P=$(docker images -aq "${PROJECT_NAME}\/*")
  if [ "${P}" != "" ]; then
    echo "Removing images"  &2> /dev/null
    docker rmi ${P} -f
  fi
}

function prune()
{
  docker system prune -a --volumes
}

echo "For all Docker containers or images"
echo "1 - Kill and remove only the containers"
echo "2 - Kill and remove the containers and remove all the downloaded images"
echo "3 - Remove all stopped containers, unused images, networks and volumes not used by at least one container and all build cache"
echo "4 - Quit and not do anything"
echo
PS3="Please select which option > "
options=("Kill & Remove" "Remove Images" "Prune" "Quit")
select yn in "${options[@]}"; do
    case $yn in
        "Kill & Remove" ) stop;  break;;
        "Remove Images" ) stop;  remove; break;;
        "Prune" ) stop;  prune; break;;
        "Quit" ) exit;;
    esac
don
