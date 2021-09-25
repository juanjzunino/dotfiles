# --------------------------------- Settings ----------------------------------
# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats "%F{242} (%b%f%{$fg[red]%}%u%{$fg[cyan]%}%c%F{242})%f"
setopt PROMPT_SUBST
PS1='jjz %F{242}::%f %{$fg[blue]%}%1~${vcs_info_msg_0_} %{$fg[red]%}|%{$reset_color%} '

# Options
disable r

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]=fg=#005bdf
ZSH_HIGHLIGHT_STYLES[builtin]=fg=#005bdf
ZSH_HIGHLIGHT_STYLES[function]=fg=#005bdf
ZSH_HIGHLIGHT_STYLES[command]=fg=#005bdf
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white


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

# --------------------------------- Exports -----------------------------------
# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

