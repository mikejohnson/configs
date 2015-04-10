# Alias tmux for 256 color support
alias tmux="tmux -2"

# Colorize prompt
CLEAR="\[\e[0m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
WHITE="\[\e[0;37m\]"
B_BLACK="\[\e[1;30m\]"
B_RED="\[\e[1;31m\]"
B_GREEN="\[\e[1;32m\]"
B_BLUE="\[\e[1;34m\]"

# green user on blue server
export PS1="$WHITE[$CLEAR$GREEN\u$CLEAR$WHITE@$CLEAR$B_BLUE\H$CLEAR $B_BLACK\W$CLEAR]\$ "

# green user on red server
#export PS1="$WHITE[$CLEAR$GREEN\u$CLEAR$WHITE@$CLEAR$RED\H$CLEAR $B_BLACK\W$CLEAR]\$ "

# bright red user on red server
#export PS1="$WHITE[$CLEAR$B_RED\u$CLEAR$WHITE@$CLEAR$RED\H$CLEAR $B_BLACK\W$CLEAR]\$ "
