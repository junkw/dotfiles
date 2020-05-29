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
## PHPBrew
#
export PHPBREW_ROOT=$HOME/opt/phpbrew
export PHPBREW_HOME=$PHPBREW_ROOT
export PHPBREW_LOOKUP_PREFIX=/usr/local/opt:$HOME/opt:/usr/local
init_phpbrew=$PHPBREW_HOME/bashrc

if [[ -d $PHPBREW_ROOT && -r $init_phpbrew ]]; then
    source $init_phpbrew
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
    id=$(grep ${BUFFER} ${HISTFILE} | sed -e "s/: \(.*\);\(.*\)/\1/")
    gsed -i "/${id}/d" $HISTFILE
    BUFFER=""
    zle clear-screen
}
zle -N peco-delete-history
bindkey '^xcr' peco-delete-history


#
## Aliases
#
if [[ `which exa` ]]; then
    alias ls="exa --group-directories-first --color-scale"
    alias ll="exa -alh --group-directories-first --color-scale --git"
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

if [[ `which phpbrew` ]]; then
    alias phpbrew_allupdate="phpbrew self-update && phpbrew known --update"
fi

if [[ `which tmux` ]]; then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/config"
fi
