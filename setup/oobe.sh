#!/usr/bin/env bash

# Updates
pkg upgrade -y

# User packages
pkg install -y $(cat apt-packages.txt)

# Node.js
npm install -g yarn
yarn global add $(cat node-packages.txt)

# Python
pip install $(cat python-packages.txt)

# Rust
cargo install $(cat rust-packages.txt)

# Fish
chsh -s fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
while read REPO
do
  CLONE_CMD=$(echo $REPO | awk '{print "git clone -q https://github.com/"$1" "$2}')
  $CLONE_CMD
done < repositories.txt


