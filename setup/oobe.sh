#!/usr/bin/env bash

clear

# Updates
printf 'Updating Termux packages...\n'
pkg upgrade -y

# User packages
printf '\nInstalling user packages...\n'
pkg install -y $(cat apt-packages.txt)

# Node.js
printf '\nInstalling Node.js packages...\n'
npm install -g yarn
yarn global add $(cat node-packages.txt)

# Python
printf '\nUpgrading pip and installing Python packages...\n'
pip install --upgrade pip
pip install $(cat python-packages.txt)

# Rust
printf '\nInstalling Rust crates...\n'
cargo install $(cat rust-packages.txt)

# Fish
printf '\nConfigurating fish shell...\n'
chsh -s fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
printf '\nCloning vim plugin repositories...\n'
while read REPO
do
  CLONE_CMD=$(echo $REPO | awk '{print "git clone -q https://github.com/"$1" "$2}')
  $CLONE_CMD
done < repositories.txt

printf '\nDONE\n'
