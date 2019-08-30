#!/bin/bash

_PASS="$1"

if [[ -z $_PASS ]];then
  echo 'Please provide one argument'
else
  sudo docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=$1 -d --name mysql_inst01 mysql:8
  sudo docker run -p 6379:6379 -d --name redis_inst01 redis:5
fi
