# --------------------------------- Settings ----------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ----------------------------------- Path ------------------------------------
# Local scripts
export PATH="$PATH:$HOME/bin"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init --path)"

# Rust
source "$HOME/.cargo/env"
