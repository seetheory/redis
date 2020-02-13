#!/bin/sh

PNAME="redis"
LOGFILE="docker.log"

red="\033[0;31m"
yellow="\033[0;33m"
green="\033[0;32m"
reset="\033[0m"

docker container stop $PNAME 1>> docker.log 2>> docker.log || printf "${red}container ${yellow}redis${reset} is not running\n"
docker container rm $PNAME 2>> docker.log || printf "${red}container ${yellow}redis${reset} does not exist, creating\n"

set -e

echo "${yellow}starting${reset} container $PNAME"

dargs=" --rm --name=$PNAME -p 6379:6379 "
if [ "$1" == '-i' ]
then
docker run -it $dargs redis:5.0 bash
else
docker run -d $dargs redis:5.0
fi

