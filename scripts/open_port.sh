#!/bin/bash

PORT=$1

RE='^[0-9]+$'
if [[ -z $1 ]];then
  echo "[HELP]: ./open_port.sh 3000"
elif ! [[ $1 =~ $RE ]];then
  echo "[ERROR]: $1 is not a number"
else
  read -r -p "Are you sure to open port $1? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      sudo iptables -A INPUT  -i $ETH0 -p tcp --dport $1 -m state --state NEW,ESTABLISHED -j ACCEPT
      sudo iptables -A OUTPUT -o $ETH0 -p tcp --dport $1 -m state --state ESTABLISHED     -j ACCEPT
      ;;
    *)
      echo "PASS"
      ;;
  esac
fi

