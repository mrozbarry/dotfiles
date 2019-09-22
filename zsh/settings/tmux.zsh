alias devify="tmux new-session -d \; send-keys -t 0 'nvim' ENTER \; new-window \; send-keys -t 1 'nvm use && git status' ENTER \; select-window -t 1 \; attach"
