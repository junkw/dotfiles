# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# Paths
typeset -T SUDO_PATH sudo_path
typeset -T INFOPATH infopath
typeset -gxU path fpath manpath sudo_path infopath

sudo_path=({/usr/local,/usr,}/sbin(N-/))

path=({/usr/{local/,},/}bin
      $sudo_path
      /opt/X11/bin(N-/)
      /Library/TeX/texbin(N-/)
      $HOME/{.nodebrew/current/,}bin(N-/)
      $path)

fpath=(/usr/local/share/zsh/functions(N-/)
       $(brew --repository)/Library/Contributions(N-/)
       $fpath)

manpath=(/usr/{local/,}share/man
         /Applications/Xcode.app/Contents/Developer/usr/share/man(N-/)
         /opt/X11/share/man(N-/)
         $HOME/.nodebrew/current/share/man(N-/)
         $manpath)

infopath=(/usr/local/share/info{/emacs,}(N-/)
          /usr/share/info)

if [[ `which nodebrew` ]]; then
    export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules
fi

if [[ -s /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Homebrew
if [[ `which brew` ]]; then
    export HOMEBREW_MAKE_JOBS=4
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    export PKG_CONFIG_PATH=$(brew --prefix)/opt/openssl/lib/pkgconfig
fi

# Pager
export EDITOR=vim
export VISUAL=vim

export LESSHISTFILE=-
export LESS='-R'
if [[ -s /usr/local/bin/src-hilite-lesspipe.sh ]]; then
    export LESSOPEN='| src-hilite-lesspipe.sh %s'
fi

# Hunspell
export DICTIONARY=en_US
export DICPATH=$HOME/Library/Spelling/
