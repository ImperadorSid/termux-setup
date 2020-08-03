#!/usr/bin/env bash

pkg update
pkg upgrade

pkg install $(cat apt-packages.txt)

./fish-variables.fish

