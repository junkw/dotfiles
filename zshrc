# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-

# Options
setopt print_eight_bit

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file $HOME/.zchpwd-recent-dirs

# Aliases
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/config"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias syncmail="offlineimap && mu index --muhome $XDG_CACHE_HOME/mu/ -m XDG_DATA_HOME/mail"
