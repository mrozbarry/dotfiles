# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------

# Exports
# -------
#export FZF_DEFAULT_COMMAND='fd --type f'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
