# Enable colors
autoload -U colors && colors

# Prompt
autoload -Uz promptinit
autoload -Uz vcs_info
promptinit
PS1="%{$fg[cyan]%}%m %{$fg[magenta]%}:: %{$fg[blue]%}%1~ %B%{$fg[red]%}|%b "

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Settings
export EDITOR="nvim"
export TERMINAL="alacritty"

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
if type brew &>/dev/null; then
 FPATH=/usr/local/share/zsh-completions:$FPATH
 autoload -Uz compinit && compinit
fi

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Local scripts
export PATH="$PATH:$HOME/bin"

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

