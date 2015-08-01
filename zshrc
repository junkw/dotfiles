# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Options
setopt print_eight_bit

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file $HOME/.zchpwd-recent-dirs

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
