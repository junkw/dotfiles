# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Paths
typeset -T SUDO_PATH sudo_path
typeset -T INFOPATH infopath
typeset -gxU path fpath manpath sudo_path infopath

sudo_path=({/usr/local,/usr,}/sbin(N-/))

path=({/usr/{local/,},/}bin
      $sudo_path
      /opt/X11/bin(N-/)
      /usr/texbin(N-/)
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

# Homebrew
export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
