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
alias ls-symbolic-link='ls -alF `find $(pwd) -type l`'

# cd
alias cl='cd -'
alias ctmp='[ -d $TMPDIR ] && cd $TMPDIR || cd /tmp'

# gdb
if [ -x /usr/bin/gdb ]; then
    alias gdb='gdb -tui'
fi

# ack-grep
if [ -x /usr/bin/ack-grep ]; then
    alias ack='ack-grep'
fi

# disable Caps-Lock key
alias nocaps='setxkbmap -layout us -option ctrl:nocaps'

# cscope
if [ -x /usr/bin/cscope ]; then
    alias cscope.cc='find `pwd` -name "*.h" -o -name "*.cc" -o -name "*.cpp" > cscope.files && cscope -b'
    alias cscope.java='find `pwd` -name "*.java" > cscope.files && cscope -b'
fi

# ctags
if [ -x /usr/bin/ctags ]; then
    alias ctags.cc='ctags --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=c++'
    alias ctags.java='ctags --sort=yes --language-force=java'
fi

# format json using python
alias pmj='python -m json.tool'
alias pms='python -m SimpleHTTPServer 7777'

# exclude directories
alias find.exclude='find ! -path "*/.git/*"'
alias find.name='find -name'
alias find.path='find -path'
alias grep.exclude='grep --exclude="~*" --exclude="*.swp" --exclude="tags" --exclude="cscope.out" --exclude-dir=".git" --color=auto'
alias grep.content='grep -rn'

# vim
alias vims='[ -f Session.vim ] && vim -S Session.vim || vim'

# emacs
alias em='emacs'

# pip
alias pip_upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

# tmux
alias ta='tmux attach'
alias td='tmux detach'

# git
alias gam='git add . && git commit -m "MOD: quickfix at $(date)" && git push'

# vim: filetype=sh
