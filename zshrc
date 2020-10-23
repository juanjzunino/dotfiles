# Enable colors
autoload -U colors && colors

# Prompt
autoload -Uz promptinit
promptinit
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%} $%b "

PS1="%{$fg[cyan]%}[%{$fg[blue]%}%n@%m %{$fg[green]%}%1~%{$fg[cyan]%}] %B%{$fg[yellow]%}>%b "

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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
# <<< conda initialize <<<

# Syntax highlighting (must be at the end of the file)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
