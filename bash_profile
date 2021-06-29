# --------------------------------- Settings ----------------------------------
export EDITOR="vim"
export VISUAL="vim"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ----------------------------------- Path ------------------------------------
# Local scripts
export PATH="$PATH:$HOME/bin"

# Rust
source "$HOME/.cargo/env"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# ---------------------------------- Bashrc -----------------------------------
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
