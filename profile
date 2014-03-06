# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man:/Applications/Xcode.app/Contents/Developer/usr/share/man:/opt/X11/share/man
export INFOPATH=/usr/local/share/info/emacs:/usr/local/share/info:/usr/share/info

if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi

export EDITOR=vim
export VISUAL=vim

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export HOMEBREW_KEEP_INFO=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ -f ~/.nodebrew/nodebrew ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    nodebrew use stable

    export MANPATH=$HOME/.nodebrew/current/share/man:$MANPATH
    export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules
fi

if [[ -d /usr/texbin ]]; then
    export PATH=$PATH:/usr/texbin
fi
