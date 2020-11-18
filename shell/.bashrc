# # Prompt
# PS1="\[\033[36m\][\[\033[m\]\[\033[34m\]\u@\h\[\033[m\] \[\033[32m\]\W\[\033[m\]\[\033[36m\]] \e[1m\e[33m> \e[0m"

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

# Starship prompt
eval "$(starship init bash)"
