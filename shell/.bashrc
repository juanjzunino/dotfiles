# --------------------------------- Settings ----------------------------------
# Source aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Settings
export EDITOR="vim"
export VISUAL="vim"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ---------------------------------- Prompt -----------------------------------
# Prompt
PS1="\[\033[37m\]jjz \[\033[37m\]:: \[\033[34m\]\W \[\033[31m\]|\e[0m "

# ---------------------------------- Plugins ----------------------------------
# Fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ----------------------------------- Path ------------------------------------
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.cargo/env

# Local scripts
export PATH="$PATH:$HOME/bin"

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# >>> conda initialize >>>
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ----------------------------------- Tmux ------------------------------------
# Activate conda when starting a new tmux session
[[ -z $TMUX ]] || conda deactivate; conda activate base

