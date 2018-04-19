# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

{
    zshrc=$HOME/.zshrc
    if [[ -r $zshrc && (! -s ${zshrc}.zwc || $zshrc -nt ${zshrc}.zwc) ]]; then
        zcompile $zshrc
    fi

    home_zcompdump=$HOME/.zcompdump
    if [[ -r $home_zcompdump && (! -s ${home_zcompdump}.zwc || $home_zcompdump -nt ${home_zcompdump}.zwc) ]]; then
        zcompile $home_zcompdump
    fi

    zplug_zcompdump=$ZPLUG_HOME/zcompdump
    if [[ -r $zplug_zcompdump && (! -s ${zplug_zcompdump}.zwc || $zplug_zcompdump -nt ${zplug_zcompdump}.zwc) ]]; then
        zcompile $zplug_zcompdump
    fi
} &!
