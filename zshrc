# --------------------------------- Settings ----------------------------------
# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info

# Options
disable r

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
# if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#     source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi

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
eval "$(starship init zsh)"

