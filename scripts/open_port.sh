#!/bin/bash

PORT=$1
# ETH0 is network interface, view it by `ifconfig -a`
ETH0=ens3

RE='^[0-9]+$'
if [[ -z $PORT ]];then
  echo "[HELP]: ./open_port.sh 3000"
elif ! [[ $PORT =~ $RE ]];then
  echo "[ERROR]: $PORT is not a number"
else
  read -r -p "Are you sure to open port $PORT? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      sudo iptables -A INPUT  -i $ETH0 -p tcp --dport $PORT -m state --state NEW,ESTABLISHED -j ACCEPT
      sudo iptables -A OUTPUT -o $ETH0 -p tcp --dport $PORT -m state --state ESTABLISHED     -j ACCEPT
      ;;
    *)
      echo "PASS"
      ;;
  esac
fi

