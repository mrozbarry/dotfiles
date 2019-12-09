# Dotfiles

My dotfiles for vim, zsh, and tmux.
Also uses [zim](https://github.com/zimfw/zimfw).

# Install

## Legwork

 - `git clone git@github.com:mrozbarry/dotfiles.git ~/.dotfiles`
 - `cd .dotfiles`
 - `./install.sh` to install required packages and things

## Load the zsh stuff

Open up your `~/.zshrc` file, and add this to the bottom:

```zsh
# ...maybe other stuff

source ~/.dotfiles/zshrc
```

## Update it later

Update my dotfiles stuff

```zsh
$ updot
```

## Customization

I don't support it, but there wouldn't be a lot of effort required to load up custom `.vim` and `.zsh` files.
