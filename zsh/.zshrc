export PATH="/usr/local/sbin:$PATH"
source $ZDOTDIR/aliases.zsh
setopt HIST_SAVE_NO_DUPS

zstyle ':completion:*' menu select

fpath+=$ZDOTDIR/completions
autoload -U compinit; compinit

bindkey -v
bindkey '^[[Z' reverse-menu-complete

fpath+=$ZDOTDIR/typewritten
autoload -U promptinit; promptinit
prompt typewritten

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(pyenv init --path)"
