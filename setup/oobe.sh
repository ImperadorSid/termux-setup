#!/usr/bin/env bash

clear

# Updates
printf 'Updating Termux packages...\n'
pkg upgrade -y

# User packages
printf '\n\nInstalling user packages...\n'
pkg install -y $(cat apt-packages.txt)

# Node.js
printf '\n\nInstalling Node.js packages...\n'
npm install -g yarn
yarn global add $(cat node-packages.txt)

# Python
printf '\n\nUpgrading pip and installing Python packages...\n'
pip install --upgrade pip
ipip install $(cat python-packages.txt)

# Rust
printf '\n\nInstalling Rust crates...\n'
cargo install $(cat rust-packages.txt)

# Fish
printf '\n\nConfigurating fish shell...\n'
chsh -s fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
printf '\n\nCloning vim plugin repositories...\n'
while read REPO
do
  CLONE_CMD=$(echo $REPO | awk '{print "git clone https://github.com/"$1" "$2}')
  $CLONE_CMD
done < repositories.txt

printf '\n\nDONE\n'
