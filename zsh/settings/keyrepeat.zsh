if typeset -f xset > /dev/null; then
  xset r rate 200 40
fi
if typeset -f setxkbmap > /dev/null; then
  setxkbmap -layout us -option ctrl:nocaps
fi
