#!/usr/bin/env bash

# Updates
pkg update
pkg upgrade

# User packages
pkg install $(cat apt-packages.txt)

# Fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
for REPO in $(awk '{print "https://github.com/"$1" "$2}' repos.txt)
do
  $REPO
done

# Rust
cargo install lsd

