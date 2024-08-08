### Added by Codeium. These lines cannot be automatically removed if modified
if command -v termium > /dev/null 2>&1; then
  eval "$(termium shell-hook show pre)"
fi
### End of Codeium integration



# contains zsh configuration
autoload -U compinit; compinit

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' menu:search select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# behave like vim
set -o vi

# startup folder
cd ~

# aliases
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
eval $(thefuck --alias fk)

tmux && q
clear
city

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh



source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### Added by Codeium. These lines cannot be automatically removed if modified
if command -v termium > /dev/null 2>&1; then
  eval "$(termium shell-hook show post)"
fi
### End of Codeium integration