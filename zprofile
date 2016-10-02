# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

#
## zplug
#
init_zplug=$HOME/.zplug/init.zsh

# Bootstrap
if [[ ! -s $init_zplug ]]; then
  git clone https://github.com/zplug/zplug $HOME/.zplug
  source $init_zplug && zplug update --self
fi

source $init_zplug

# Plugins
zplug "sorin-ionescu/prezto"

export ENHANCD_LOG=$XDG_CACHE_HOME/enhancd/enhancd.log
zplug "b4b4r07/enhancd", use:init.sh

# Install plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "

    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load


#
## Prezto
#
init_prezto=$HOME/.zprezto/init.zsh

if [[ ! -s $init_prezto ]]; then
    ln -s $HOME/.zplug/repos/sorin-ionescu/prezto $HOME/.zprezto
fi

source $init_prezto


#
## Functions
#
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
