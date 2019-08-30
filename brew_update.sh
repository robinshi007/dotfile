#!/bin/bash

red=$(tput setaf 1)
# green=$(tput setaf 2)
reset=$(tput sgr0)

(set -x; brew update;)

# update package
for pkg in $(brew outdated | awk '{print $1}')
do
    echo "${red}update ${pkg} ...${reset}."
    (set -x; brew upgrade "$pkg";)
done

# update cask package
for cask in $(brew cask outdated | awk '{print $1}')
do
    echo "${red}update cask ${cask} ...${reset}."
    # (set -x; brew cask reinstall "$cask";)
    (set -x; brew cask install --force "$cask";)
done

echo "${red}brew clean up ...${reset}."
(set -x; brew cleanup;)
echo "${red}brew clean up done.${reset}."

