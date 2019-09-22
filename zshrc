# Custom zsh configuration

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v

for config_file ($HOME/.dotfiles/zsh/settings/*.zsh); do
  source $config_file
done
