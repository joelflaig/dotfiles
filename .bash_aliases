# aliases for bash
alias c=clear
alias :q=exit
alias q=exit
alias x=exit
alias eb='exec bash'
alias vim=nvim
alias t=touch
alias md=mkdir
alias aliases='cat ~/.bash_aliases'
alias nitch='~/.config/nitch/nitch'
alias "pipes"="pipes.sh -t 1"

# configuration aliases
alias cfg='nvim ~/dotfiles/.bashrc'
alias cfga='nvim ~/dotfiles/.bash_aliases'
alias cfgt='nvim ~/dotfiles/.tmux.conf'
alias cfgv='nvim ~/dotfiles/.config/nvim/init.lua'
alias cfgs='nvim ~/.config/starship.toml'

# aliases for machine initialization
alias ini_init='init/init.sh'
alias ini_test='init/test.sh'

# git aliases
alias gs='git status'
alias gl='git log'
alias gd='git diff'

alias ga='git add'
alias gai='git add -i'
alias gaa='git add -A'

alias gcm='git commit -m "'

alias gps='git push'
alias gpl='git pull'

# lazygit
alias lg=lazygit

# z aliases
alias z=cd
alias zi=cdi
alias df='z ~/dotfiles'
alias nex='z ~/programming/mojo/Nexus/'
alias dsa='z ~/programming/mojo/Nexus-DSA'
alias net='z ~/programming/mojo/NexusNet'
alias tui='z ~/programming/mojo/Nexus-TUI'
alias cli='z ~/programming/mojo/Nexus/cli'
alias zsw='zoxide query -l -s | cat'

# python
alias python=python3
alias pip=pip3
alias py=python

# Compilation/testing
alias build='bash ./bin/build.sh'
alias test='bash ./src/tests/test.sh'

# ls aliases
alias l='exa --group-directories-first'
alias ls='exa --icons --group-directories-first'
alias ll='ls -alh --group-directories-first'
alias la='ls -a --group-directories-first'
alias lt='ls -a --tree --group-directories-first'
alias lt2='ls -a --tree -L 2'
alias lt3='ls -a --tree -L 3'
alias le='ls -@'
alias ltg='lt --git'
alias lag='la --git'
cl() {
	z "$@" && la
}

# cat aliases
alias cat='batcat --theme="Catppuccin Macchiato"'
alias cgd='cat --diff-context 3'
alias cc='batcat ~/cat'

# fzf aliases
alias fzf="fzf --border rounded --margin 2.5% --preview='batcat --color=always --style full --tabs 2 {}'"
alias gdf="fzf --border rounded --margin 2.5% --preview='batcat --color=always --style full --tabs 2 --diff-context 3 {}'"

# fzf with various other commands
alias nvf='nvim $(fzf)'
alias catf='cat $(fzf)'
alias cgdf='cgd $(fzf)'

# fzf aliases for file editing
alias cfgf="df && nvf"
alias nexf="nex && nvf"
alias dsaf="dsa && nvf"
alias netf="net && nvf"
alias tuif="tui && nvf"
alias clif="cli && nvf"
