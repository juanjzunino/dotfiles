# --------------------------------- Settings ----------------------------------
# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Options
disable r
bindkey -v

# Exports
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
# export TERM=xterm-256color
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ----------------------------------- Alias -----------------------------------
# Sane defaults
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Optimization
alias cplex='/Applications/CPLEX_Studio129/cplex/bin/x86-64_osx/cplex'

# Editor
alias vim='nvim'

# Open files
alias finder="open -R"

# Exa
alias ls="exa -a"
alias l="exa -la"
alias tree="exa --tree"
alias mtree="exa --tree --long"

# Git
alias g="git"
alias gs="git status"
alias gg="git log --graph --pretty=oneline"
alias gp="git pull"

# Jupyter Notebooks
alias jn="jupyter notebook"

# Folder's shortcuts
alias desk="cd ~/Desktop"
alias loads="cd ~/Downloads"
alias docs="cd ~/Documents"
alias projects="cd ~/projects"
alias resources="cd ~/Documents/Resources"
alias mim="cd ~/Documents/knowledge/MiM+Analytics"

# ---------------------------------- Plugins ----------------------------------
# Autosuggestions
if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Fuzzy Finder
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# Autojump
if [ -f /usr/local/etc/profile.d/autojump.sh ]; then
    source /usr/local/etc/profile.d/autojump.sh
fi

# Syntax highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# ----------------------------------- Path ------------------------------------
# Local scripts
export PATH="$PATH:$HOME/bin"

# Rust
source "$HOME/.cargo/env"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin 

# Python
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
# . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

# Starship
eval "$(starship init zsh)"

