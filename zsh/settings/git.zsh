git() {
  # Uncomment for bash
  # set -e -u
  if [ $# -ge 2 ]; then
      if [ "x$1" = "xreset" -a "x$2" = "x--hard" ]; then
          echo 'Are you sure? (yes|no)?'
          read resp || return $?
          test "$resp" = "yes" || return 0
      fi
  fi
  command git "$@"
}

git config --global alias.cob 'checkout -b'
git config --global branch.develop.mergeoptions '--no-ff'
alias ga='git add'
alias gs='git status'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpl='git pull'
alias gd='git diff'
alias grh='git reset --hard'

alias gitSync='git fetch upstream && git reset --hard upstream/master'
