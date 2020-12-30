# # Prompt
PS1="\[\033[37m\]\h \[\033[31m\]:: \[\033[32m\]\W\[\033[m\] \e[1m\e[34m| \e[0m"

# Settings
export EDITOR="nvim"
export TERMINAL="alacritty"

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Source aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source "$HOME/.cargo/env"
