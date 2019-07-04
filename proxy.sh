#!/bin/bash

if [[ $1 != "enable" ]] && [[ $1 != "disable" ]];then
  echo "Please use command args 'enable' or 'disable'."
fi

PROXY_HOST=127.0.0.1:1081
PROXY_URL="http://$PROXY_HOST"

if [[ $1 == "enable" ]];then
  echo 'Enabling http proxy'
  git config --global http.proxy $PROXY_URL
  git config --global https.proxy $PROXY_URL
  echo "need to do 'export http_proxy=$PROXY_HOST'"
  echo "need to do 'export https_proxy=$PROXY_HOST'"
elif [[ $1 == "disable" ]];then
  echo 'Disabling http proxy'
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  echo "need to do 'unset http_proxy'"
  echo "need to do 'unset https_proxy'"
fi
