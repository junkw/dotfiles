# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

#
## zplug
#
init_zplug=$ZPLUG_HOME/init.zsh

# Bootstrap
if [[ ! -r $init_zplug ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $init_zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug "sorin-ionescu/prezto", use:false

export ENHANCD_DIR=$XDG_CACHE_HOME/enhancd
zplug "b4b4r07/enhancd", use:init.sh, lazy:true

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

if [[ ! -r $init_prezto ]]; then
    ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
fi

source $init_prezto


#
## Options
#
setopt print_eight_bit


#
## Widgets
#
function peco-kill-process() {
    ps -ef | peco | awk '{ print $2 }' | xargs kill
    zle clear-screen
}
zle -N peco-kill-process
bindkey '^xcp' peco-kill-process

function peco-select-history() {
    BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-delete-history() {
    BUFFER=$(cat ${HISTFILE} | tail -r | peco --query "$LBUFFER")
    id=$(grep ${BUFFER} ${HISTFILE} | sed -e "s/: \(.*\);\(.*\)/\1/")
    sed -i "/${id}/d" $HISTFILE
    BUFFER=""
    zle clear-screen
}
zle -N peco-delete-history
bindkey '^xcr' peco-delete-history


#
## Aliases
#
alias ls="exa --group-directories-first --color-scale"
alias fetchmail="mbsync -a -c $XDG_CONFIG_HOME/mbsync/config"
alias mulazyindex="mu index --lazy-check --nocleanup --muhome $XDG_CACHE_HOME/mu -m $XDG_DATA_HOME/gmail"
alias muindex="mu index --muhome $XDG_CACHE_HOME/mu -m $XDG_DATA_HOME/gmail"
alias mureindex="mu index --rebuild --muhome $XDG_CACHE_HOME/mu -m $XDG_DATA_HOME/gmail"
alias syncmail="fetchmail && mulazyindex"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/config"
