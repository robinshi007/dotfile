#!/bin/bash

OS=$(uname -s)


if [ "$1" == "install" ]; then
  if [ "$OS" == "Darwin" ]; then
    echo "=== MacOS Install ==="
    cp -r config/nvim/ ~/.config/nvim
  fi
else
  if [ "$OS" == "Darwin" ]; then
    echo "=== MacOS Update ==="
    cp -r ~/.config/nvim config/
    cp -r ~/.config/fish config/
  fi
fi
