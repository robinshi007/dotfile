#!/bin/bash

# privoxy config
#forward-socks5 / 127.0.0.1:1080 .
#listen-address  127.0.0.1:8118

ss-local -c /home/robin/shadowsocks.json 2>&1
