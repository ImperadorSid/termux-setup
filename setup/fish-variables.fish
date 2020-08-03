#!/usr/bin/env fish
set -U FZF_DEFAULT_OPTS '--color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
set -U FZF_LEGACY_KEYBINDINGS 0

set -U FZF_FIND_FILE_COMMAND 'fd . $dir'
set -U FZF_CD_COMMAND 'fd --type directory . $dir'
set -U FZF_OPEN_COMMAND $FZF_FIND_FILE_COMMAND
set -U FZF_PREVIEW_FILE_CMD 'bat --style=changes,numbers,snip'

set -U FZF_COMPLETE 1
set -U FZF_TMUX 1

