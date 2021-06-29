# --------------------------------- Settings ----------------------------------
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# ---------------------------------- Plugins ----------------------------------
# Fuzzy finder
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# Completions
if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi

# ---------------------------------- Prompt -----------------------------------
eval "$(starship init bash)"
