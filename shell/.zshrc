# Enable colors
autoload -U colors && colors

# Prompt
autoload -Uz promptinit
autoload -Uz vcs_info
promptinit
PS1="%{$fg[blue]%}%m %{$fg[green]%}:: %{$fg[yellow]%}%1~ %{$fg[red]%}| "

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Settings
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM=xterm-256color

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
if type brew &>/dev/null; then
 FPATH=/usr/local/share/zsh-completions:$FPATH
 autoload -Uz compinit && compinit
fi

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.cargo/env

# Local scripts
export PATH="$PATH:$HOME/bin"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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

# Activate conda when starting a new tmux session
[[ -z $TMUX ]] || conda deactivate; conda activate base

# Syntax highlighting (must be at the end of the file)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

