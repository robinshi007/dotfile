#!/bin/bash

# version
VERSION=1.20.1
OS=linux
ARCH=amd64

cd ~/downloads
curl -OL https://go.dev/dl/go$VERSION.$OS-$ARCH.tar.gz

if [[ -d /usr/local/go ]]; then
  sudo mv /usr/local/go /usr/local/go_old
fi

tar xvf "go${VERSION}.linux-amd64.tar.gz"
sudo chown -R root:root ~/downloads/go
sudo mv go /usr/local
