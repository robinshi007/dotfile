#!/bin/bash

OS=$(uname -s)


if [ "$1" == "install" ]; then
  if [ "$OS" == "Darwin" ]; then
    echo "=== MacOS Install ==="
  fi
else
  if [ "$OS" == "Darwin" ]; then
    echo "=== MacOS Update ==="
    cp ~/.config/nvim config/ -R
    cp ~/.config/fish config/ -R
  fi
fi
