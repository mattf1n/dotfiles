export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="vim"
export VISUAL="vim"

export PATH="/Users/matthewf/.local/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export TODOTXT_DEFAULT_ACTION=ls

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# export OPENAI_API_KEY=$(pass openai)
export OPENAI_ORG_ID="org-w7nKit9OwsqNNO3i9GmXe5uk"
export MANPATH=/Users/matthewf/.local/share/man:$(echo $(man --path))

