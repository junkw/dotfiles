# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

{
    zcompdump=$HOME/.zcompdump

    if [[ -s $zcompdump && (! -s ${zcompdump}.zwc || $zcompdump -nt ${zcompdump}.zwc) ]]; then
        zcompile $zcompdump
    fi
} &!
