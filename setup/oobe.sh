#!/usr/bin/env bash

pkg update
pkg upgrade

pkg install $(cat apt-packages.txt)

./fish-variables.fish

for REPO in $(awk '{print "https://github.com/"$1" "$2}' repos.txt)
do
  $REPO
done

