# contains zsh configuration
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

set -o vi
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

tmux
clear
city

