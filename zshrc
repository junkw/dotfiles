# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

#
## Pager
#
export EDITOR=vim
export VISUAL=vim

export LESSHISTFILE=-
export LESS=" -g -i -J -m -N -R -X --underline-special --SILENT "

if [[ `which src-hilite-lesspipe.sh` ]]; then
    export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi


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
zplug "sorin-ionescu/prezto"

export ENHANCD_DIR=$XDG_CACHE_HOME/enhancd
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
## 1Password
#
if [[ `which op` ]]; then
    eval "$(op completion zsh)"; compdef _op op

    source ${HOME}/.config/op/plugins.sh
fi


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
    ID=$(grep ${BUFFER} ${HISTFILE} | gsed "s/: \(.*\);\(.*\)/\1/")
    gsed -i "/${ID}/d" $HISTFILE
    BUFFER=""
    zle clear-screen
}
zle -N peco-delete-history
bindkey '^xcr' peco-delete-history


#
## Aliases
#
if [[ `which eza` ]]; then
    alias ll="eza -alh --group-directories-first --color-scale --git"
fi

if [[ `which mbsync` && `which mu` ]]; then
    alias fetchmail="mbsync -a -c $XDG_CONFIG_HOME/mbsync/config"
    alias mulazyindex="mu index --lazy-check --nocleanup"
    alias muindex="mu index"
    alias syncmail="fetchmail && mulazyindex"
fi

if [[ `which phan` ]]; then
    alias phand="phan --daemonize-tcp-port 4846 --quick"
fi

if [[ `which tmux` ]]; then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/config"
fi

alias of="open -a Finder ./"
