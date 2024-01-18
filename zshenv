# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

#
## Locale
#
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8


#
## Paths
#

unsetopt GLOBAL_RCS

# XDG Base Directory
if [[ -z ${XDG_CONFIG_HOME} ]]; then
    export XDG_CONFIG_HOME=${HOME}/.config
fi
if [[ -z ${XDG_DATA_HOME} ]]; then
    export XDG_DATA_HOME=${HOME}/.local/share
fi
if [[ -z ${XDG_CACHE_HOME} ]]; then
    export XDG_CACHE_HOME=${HOME}/.cache
fi
if [[ -z ${XDG_RUNTIME_DIR} ]]; then
    export XDG_RUNTIME_DIR=/private/tmp
fi

# Homebrew
brew_prefix_path=/opt/homebrew

if [[ ! -e ${brew_prefix_path} ]]; then
    brew_prefix_path=/usr/local
fi


# zplug
export ZPLUG_HOME=${HOME}/opt/zplug

# composer
export COMPOSER_HOME=${HOME}/opt/composer

# nodebrew
export NODEBREW_ROOT=${HOME}/opt/nodebrew

# PATH
typeset -T SUDO_PATH sudo_path
typeset -T INFOPATH infopath
typeset -gxU path fpath manpath sudo_path infopath

sudo_path=(${brew_prefix_path}/sbin(N-/)
           {/usr/local,/usr,}/sbin(N-/))

path=(${HOME}/bin(N-/)
      ${brew_prefix_path}/bin(N-/)
      ${brew_prefix_path}/opt/{apr,apr-util,icu4c,libxml2,openjdk,openssl@1.1,sqlite,texinfo,unzip}/bin(N-/)
      ${brew_prefix_path}/share/git-core/contrib/diff-highlight(N-/)
      /opt/X11/bin(N-/)
      /Library/TeX/texbin(N-/)
      ${COMPOSER_HOME}/vendor/bin/(N-/)
      ${NODEBREW_ROOT}/{,current/bin}(N-/)
      {/usr/local,/usr,}/bin(N-/)
      ${sudo_path}
      ${path})

fpath=(${brew_prefix_path}/share/zsh/functions(N-/)
       ${HOME}/opt/nodebrew/completions/zsh(N-/)
       ${fpath})

manpath=(/usr/share/man
         ${brew_prefix_path}/share/man(N-/)
         ${brew_prefix_path}/opt/gnu-tar/libexec/gnuman(N-/)
         ${brew_prefix_path}/opt/gnu-sed/libexec/gnuman(N-/)
         /Applications/Xcode.app/Contents/Developer/usr/share/man(N-/)
         /opt/X11/share/man(N-/)
         ${NODEBREW_ROOT}/current/share/man(N-/)
         ${ZPLUG_HOME}/doc/man(N-/)
         ${manpath})

infopath=(${brew_prefix_path}/share/info{/emacs,}(N-/)
          /usr/share/info)


#
## Apps
#

# Homebrew
export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ `which brew` ]]; then
    export PKG_CONFIG_PATH=${brew_prefix_path}/opt/icu4c/lib/pkgconfig:${PKG_CONFIG_PATH}
    export PKG_CONFIG_PATH=${brew_prefix_path}/opt/libffi/lib/pkgconfig:${PKG_CONFIG_PATH}
    export PKG_CONFIG_PATH=${brew_prefix_path}/opt/libxml2/lib/pkgconfig:${PKG_CONFIG_PATH}
    export PKG_CONFIG_PATH=${brew_prefix_path}/opt/openssl@1.1/lib/pkgconfig:${PKG_CONFIG_PATH}
    export PKG_CONFIG_PATH=${brew_prefix_path}/opt/sqlite/lib/pkgconfig:${PKG_CONFIG_PATH}

    export OPENSSL_PREFIX=$(brew --prefix openssl@1.1)
    export OPENSSL_CFLAGS="-I${OPENSSL_PREFIX}/include"
    export OPENSSL_LIBS="-L${OPENSSL_PREFIX}/lib -lcrypto -lssl"

    export LDFLAGS="-L${brew_prefix_path}/opt/icu4c/lib"
    export CPPFLAGS="-I${brew_prefix_path}/opt/icu4c/include"
fi

# Java
if [[ -x /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi

# Node.js
if [[ -d ${NODEBREW_ROOT} ]]; then
    export NODE_PATH=${NODEBREW_ROOT}/current/lib/node_modules
fi

export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/config
export ELECTRON_CACHE=${HOME}/Library/Caches/electron/

# GnuPG
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

# Hunspell
export DICTIONARY=en_US
export DICPATH=${HOME}/Library/Spelling/
