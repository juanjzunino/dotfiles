# --------------------------------- Settings ----------------------------------
# Options
disable r
bindkey -v

# Exports
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER='nvim +Man!'
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# ----------------------------------- Alias -----------------------------------
# Sane defaults
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Optimization
alias cplex='/Applications/CPLEX_Studio221/cplex/bin/x86-64_osx/cplex'

# Editor
if [ "$(command -v nvim)" ]; then
    alias vim='nvim'
fi

# Open files
alias finder="open -R"

# Exa
if [ "$(command -v exa)" ];
then
    alias ls="exa -a"
    alias l="exa -la"
    alias tree="exa --tree"
else
    alias ls="ls -aG"
    alias l="ls -laG"
fi

# Git
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gg="git log --graph --pretty=oneline"
alias lg="lazygit"

# Jupyter Notebooks
alias jn="jupyter notebook"

# Folder's shortcuts
alias desk="cd ~/Desktop"
alias loads="cd ~/Downloads"
alias docs="cd ~/Documents"
alias projects="cd ~/projects"

# ---------------------------------- Plugins ----------------------------------
# Autosuggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Fuzzy Finder
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# Autojump
if [ -f /opt/homebrew/etc/profile.d/autojump.sh ]; then
    source /opt/homebrew/etc/profile.d/autojump.sh
fi

# Syntax highlighting
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup

[[ -z $TMUX ]] || conda deactivate; conda activate base

# Starship
eval "$(starship init zsh)"
