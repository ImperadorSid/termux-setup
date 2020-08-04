#!/usr/bin/env bash

# Updates
pkg update
pkg upgrade

# User packages
pkg install $(cat apt-packages.txt)


# Node.js
npm install -g yarn
yarn globall add $(cat node-packages.txt)

# Rust
cargo install $(cat rust-packages.txt)

# Fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
for REPO in $(awk '{print "https://github.com/"$1" "$2}' repos.txt)
do
  $REPO
done


