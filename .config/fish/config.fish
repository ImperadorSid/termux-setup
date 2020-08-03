#!/usr/bin/env fish

# Environment variables
set -x EDITOR vim
set -x VISUAL vim
set fish_greeting

# Alias
alias b  bat
alias B  'g --git-dir ~/backup --work-tree ~'
alias c  clear
alias g  git
alias m  man
alias rs cargo
alias s  ssh
alias t  tmux
alias v  vim
alias vf vifm
alias y  yarn

# Default options
alias fd 'fd -IHL --ignore-file ~/.config/git/ignore'
alias ll 'lsd -l --blocks permission,size,date,name --date relative'
alias ls lsd

# Additional settings
functions -e fish_right_prompt

# Start tmux
if not status is-login
and not set -q TMUX
  t new -As 'main'
end

