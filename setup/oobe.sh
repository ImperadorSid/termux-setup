#!/usr/bin/env bash

show_step() {
  tput setaf 4
  printf "\n$@\n"
  tput sgr0
}

clear

# Updates
show_step 'Updating Termux packages...'
pkg upgrade -y

# User packages
show_step 'Installing user packages...'
pkg install -y $(cat apt-packages.txt)

# Node.js
show_step 'Installing Node.js packages...'
npm install -g yarn
yarn global add $(cat node-packages.txt)

# Python
show_step 'Upgrading pip and installing Python packages...'
pip install --upgrade pip
pip install $(cat python-packages.txt)

# Rust
show_step 'Installing Rust crates...'
cargo install $(cat rust-crates.txt)

# Fish
show_step 'Configurating fish shell...'
chsh -s fish
./fish-variables.fish
fish <(curl -sL https://get.oh-my.fish) --noninteractive

# Vim plugins
show_step 'Cloning vim plugins...'
while read REPO
do
  CLONE_CMD=$(echo $REPO | awk "{print \"git clone https://github.com/\"\$1\" $HOME/.vim/pack/\"\$2}")
  $CLONE_CMD
done < vim-plugins.txt

show_step 'DONE'
