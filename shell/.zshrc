# --------------------------------- Settings ----------------------------------
# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Settings
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
disable r

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# ---------------------------------- Prompt -----------------------------------
# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats "%F{242} (%b%f%{$fg[red]%}%u%{$fg[cyan]%}%c%F{242})%f"
setopt PROMPT_SUBST
PS1='jjz %F{242}::%f %{$fg[blue]%}%1~${vcs_info_msg_0_}%{$reset_color%} %{$fg[red]%}| '

# ---------------------------------- Plugins ----------------------------------
# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

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

