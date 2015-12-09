# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Prezto
init_prezto=$HOME/.zprezto/init.zsh

if [[ -s $init_prezto ]]; then
    source $init_prezto
fi

# enhancd
init_enhancd=$HOME/.zenhancd/enhancd.sh

if [[ -s $init_enhancd ]]; then
    source $init_enhancd
    export ENHANCD_DIR=$HOME/.zenhancd
fi

# Functions
function peco-kill-process() {
    ps -ef | peco | awk '{ print $2 }' | xargs kill
    zle clear-screen
}
zle -N peco-kill-process
bindkey '^xk' peco-kill-process

function peco-select-history() {
    BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
