# --------------------------------- Settings ----------------------------------
# Options
disable r
bindkey -v

# Exports
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER='nvim +Man!'
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export BAT_THEME="gruvbox-dark"

# Homebrew
if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ----------------------------------- Alias -----------------------------------
# Sane defaults
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Optimization
alias cplex='/Applications/CPLEX_Studio221/cplex/bin/x86-64_osx/cplex'

# Open files
alias finder="open -R"

# Exa
if [ "$(command -v eza)" ];
then
    alias ls="eza -a"
    alias l="eza -la"
    alias tree="eza --tree"
else
    alias ls="ls -aG"
    alias l="ls -laG"
fi

# Git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gc="git commit"
alias gp="git push"
alias gf="git fetch --all --tags --prune"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gg="git log --graph --pretty=oneline"
alias gw="git worktree"
alias lg="lazygit"

# Folder's shortcuts
alias desk="cd ~/Desktop"
alias loads="cd ~/Downloads"
alias docs="cd ~/Documents"

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# ---------------------------------- Plugins ----------------------------------
# Autosuggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Fuzzy Finder
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# Zoxide
if [ -f /opt/homebrew/bin/zoxide ]; then
    eval "$(zoxide init zsh)"
fi

# Syntax highlighting
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#8ec07c'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#8ec07c'
fi

# Completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    for dump in ~/.zcompdump(N.mh+24); do
      compinit
    done
    compinit -C
fi

# ----------------------------------- Path ------------------------------------
# Local scripts
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/local_bin"

# Sublime
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Rust
source "$HOME/.cargo/env"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin 

# Starship
if [ -f /opt/homebrew/bin/starship ]; then
    eval "$(starship init zsh)"
fi

# Node
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
if [ -f /opt/homebrew/bin/fnm ]; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Bun
[ -s "/Users/juanjozunino/.bun/_bun" ] && source "/Users/juanjozunino/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Python
# uv
export PATH="/Users/juanjozunino/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------- Local Config --------------------------------
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

