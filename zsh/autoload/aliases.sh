#########################################################################
#         _                          _                                  #
#        | |                        | |                                 #
#        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    #
#    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   #
#   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   #
#    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   #
#                                                                       #
#                                                                       #
# This file create on 2016-09-26                                        #
# It's free for you to use and share.                                   #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

# ls
alias ll='ls -alF'
alias lh='ls -ahlF'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lsl='ls -alF `find $(pwd) -type l`'

# folder
alias cl='cd -'
alias desk='[ -d ~/Desktop ] && cd ~/Desktop'
alias ctmp='[ -d $TMPDIR ] && cd $TMPDIR || cd /tmp'

# misc
[ -x /usr/bin/gdb ] && alias gdb='gdb -tui'
[ -x /usr/bin/ack-grep ] && alias ack='ack-grep'

# format json using python
alias json='python -m json.tool'
alias server='python -m SimpleHTTPServer 7777'

# editors: vim and emacs
alias v='vim'
alias vi='vim -v'
alias e='emacs'
alias em='emacs -nw'

# pip
alias pip_upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

# tmux
alias t='tmux list-sessions'
alias ta='tmux attach || tmux new-session -s Jinghui'
alias td='tmux detach'

# git
alias g='git'
alias gam='git add . && git commit -m "Auto(`git rev-parse HEAD`)" && git push'

# mplayer
alias play='mplayer'
alias splay='mplayer -shuffle'

# disable Caps-Lock key
alias nocaps='setxkbmap -layout us -option ctrl:nocaps'


# vim: filetype=sh
