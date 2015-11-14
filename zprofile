# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Prezto
if [[ -s $HOME/.zprezto/init.zsh ]]; then
    source $HOME/.zprezto/init.zsh
fi

# Antigen
ADOTDIR=$HOME/.zantigen

if [[ -s $ADOTDIR/antigen.zsh ]]; then
    source $ADOTDIR/antigen.zsh

	# Anyframe
	if [[ `which peco` ]]; then
		antigen bundle mollifier/anyframe
		zstyle ":anyframe:selector:" use peco

        bindkey '^xb' anyframe-widget-cdr
        bindkey '^xr' anyframe-widget-execute-history
        bindkey '^xk' anyframe-widget-kill
	fi

	antigen apply
fi
