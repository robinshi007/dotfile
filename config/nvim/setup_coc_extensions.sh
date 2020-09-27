#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
pip3 install neovim pynvim jedi
# Change extension names to the extensions you need
npm install coc-json coc-html coc-css coc-snippets coc-prettier coc-python coc-tsserver coc-go --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
