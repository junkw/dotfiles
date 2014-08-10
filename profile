# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man:/Applications/Xcode.app/Contents/Developer/usr/share/man:/opt/X11/share/man
export INFOPATH=/usr/local/share/info/emacs:/usr/local/share/info:/usr/share/info

export EDITOR=vim
export VISUAL=vim

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

if [ -f ~/.nodebrew/nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    nodebrew use stable

    export MANPATH=$HOME/.nodebrew/current/share/man:$MANPATH
    export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules
fi

if [ -d /usr/texbin ]; then
    export PATH=$PATH:/usr/texbin
fi

if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\W \[\033[1;31m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
fi
