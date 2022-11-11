#!/usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#== Exports ==#
export PATH=$PATH:/usr/local/go/bin
export EDITOR='nvim'
export PAGER='more'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Zellij auto-attach config
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi



# Other sources
source "$HOME/.config/persona/aliases"
source "$HOME/.config/persona/exports"

# Bash shell prompt
PS1='\[\e[0m\][\[\e[0;1m\]\t \[\e[0m\]> \[\e[0;2;4;91m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]]\[\e[0m\]\$ \[\e[0m\]'

#== Functions ==#
function cheat() { curl "http://cheat.sh/$1"; }
