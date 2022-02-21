export PATH="/usr/local/sbin:$PATH"
source $ZDOTDIR/aliases.zsh
setopt HIST_SAVE_NO_DUPS

# completions
zstyle ':completion:*' menu select matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath+=$ZDOTDIR/completions          # directory
autoload -U compinit; compinit       # load
bindkey '^[[Z' reverse-menu-complete # select backwards with s-<tab>

bindkey -v                           # vi mode

# prompt
export TYPEWRITTEN_CURSOR="terminal"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_DISABLE_RETURN_CODE="true"
fpath+=$ZDOTDIR/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# history search
autoload  -U      up-line-or-beginning-search
autoload  -U      down-line-or-beginning-search
zle       -N      up-line-or-beginning-search
zle       -N      down-line-or-beginning-search
bindkey   "^[[A"  up-line-or-beginning-search
bindkey   "^[[B"  down-line-or-beginning-search

# pyenv
eval  "$(pyenv  init  --path)"  #  start
eval  "$(pyenv  init  -)"       #  completions
