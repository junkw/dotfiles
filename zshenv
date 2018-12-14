# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

#
## Locale
#
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8


#
## Paths
#

# XDG Base Directory
if [[ -z $XDG_CONFIG_HOME ]]; then
    export XDG_CONFIG_HOME=$HOME/.config
fi
if [[ -z $XDG_DATA_HOME ]]; then
    export XDG_DATA_HOME=$HOME/.local/share
fi
if [[ -z $XDG_CACHE_HOME ]]; then
    export XDG_CACHE_HOME=$HOME/.cache
fi
if [[ -z $XDG_RUNTIME_DIR ]]; then
    export XDG_RUNTIME_DIR=/private/tmp
fi

# zplug
export ZPLUG_HOME=$HOME/opt/zplug

# composer
export COMPOSER_HOME=$HOME/opt/composer

# nodebrew
export NODEBREW_ROOT=$HOME/opt/nodebrew

# PATH
typeset -T SUDO_PATH sudo_path
typeset -T INFOPATH infopath
typeset -gxU path fpath manpath sudo_path infopath

sudo_path=({/usr/local{,/opt/icu4c},/usr,}/sbin(N-/))

path=({/usr/{local/{,opt/{apr,apr-util,curl,gettext,gpg-agent,icu4c,libxml2,openssl,sqlite,texinfo}/},},/}bin(N-/)
      $sudo_path
      /opt/X11/bin(N-/)
      /Library/TeX/texbin(N-/)
      $HOME/bin(N-/)
      $COMPOSER_HOME/vendor/bin/(N-/)
      $NODEBREW_ROOT/{,current/bin}(N-/)
      $HOME/opt/npm/bin/(N-/)
      /usr/local/share/git-core/contrib/diff-highlight(N-/)
      $path)

fpath=(/usr/local/share/zsh/functions(N-/)
       $fpath)

manpath=(/usr/{local/,}share/man
         /usr/local/opt/gnu-tar/libexec/gnuman(N-/)
         /Applications/Xcode.app/Contents/Developer/usr/share/man(N-/)
         /opt/X11/share/man(N-/)
         $NODEBREW_ROOT/current/share/man(N-/)
         $ZPLUG_HOME/doc/man(N-/)
         $manpath)

infopath=(/usr/local/share/info{/emacs,}(N-/)
          /usr/share/info)


#
## Apps
#

# Homebrew
export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ `which brew` ]]; then
    brew_prefix_path=$(brew --prefix)

    export PKG_CONFIG_PATH=$brew_prefix_path/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$brew_prefix_path/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$brew_prefix_path/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$brew_prefix_path/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$brew_prefix_path/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH
fi

# PHPBrew
export PHPBREW_HOME=$HOME/opt/phpbrew
export PHPBREW_ROOT=$PHPBREW_HOME
init_phpbrew=$PHPBREW_HOME/bashrc

if [[ -d $PHPBREW_HOME && -r $init_phpbrew ]]; then
    export PHPBREW_LOOKUP_PREFIX=/usr/local/opt:/usr/local

    source $init_phpbrew
fi

# Java
if [[ -x /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi

# Node.js
if [[ -d $NODEBREW_ROOT ]]; then
    export NODE_PATH=$NODEBREW_ROOT/current/lib/node_modules
fi

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export ELECTRON_CACHE=$HOME/Library/Caches/electron/

# GnuPG
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Hunspell
export DICTIONARY=en_US
export DICPATH=$HOME/Library/Spelling/

# mpv
export DVDCSS_CACHE=$XDG_CACHE_HOME/mpv/dvdcss

# Pager
export EDITOR=vim
export VISUAL=vim

export LESSHISTFILE=-
export LESS="-R"

if [[ `src-hilite-lesspipe.sh` ]]; then
    export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi
