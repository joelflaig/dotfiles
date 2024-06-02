# Setup fzf
# ---------
if [[ ! "$PATH" == */home/joel/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/joel/.fzf/bin"
fi

eval "$(fzf --bash)"
