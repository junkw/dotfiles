# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Options
setopt print_eight_bit

# Aliases
alias muindex="mu index --muhome $XDG_CACHE_HOME/mu/ -m $XDG_DATA_HOME/mail/"
alias syncmail="offlineimap && muindex"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/config"
alias zmv="noglob zmv -W"
