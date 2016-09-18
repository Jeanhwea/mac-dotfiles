#########################################################################
#         _                          _                                  #
#        | |                        | |                                 #
#        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    #
#    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   #
#   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   #
#    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   #
#                                                                       #
#                                                                       #
# This is a personal code file,                                         #
# It's free for you to use and share.                                   #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

# ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
fi
alias ll='ls -alF'
alias lh='ls -ahlF'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias ls-symbolic-link='ls -alF `find $(pwd) -type l`'

# cd
alias cl='cd -'

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

# open directories or url
alias open='xdg-open'

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^.*>\s*//;s/[;&|]\s*alert$//'\'')"'

# vim
alias vims='[ -f Session.vim ] && vim -S Session.vim || vim'

# backup & restore using rsync
# rsync -avr -e ssh <sources> <destination>
alias restore='rsync --archive --verbose --rsh=ssh                      \
                --exclude=@eaDir                                        \
                --exclude=*.class                                       \
                --exclude=*.o                                           \
                    root@gala:/volume1/homes/hujh/backup/latitude/      \
                        /home/hujh'
alias ybackup='rsync --archive --verbose --recursive --delete           \
                --exclude=*.class                                       \
                --exclude=*.pyc                                         \
                --exclude=*.o                                           \
                    /home/hujh/Codes                                    \
                    /home/hujh/Desktop                                  \
                    /home/hujh/Documents                                \
                    /home/hujh/Downloads                                \
                    /home/hujh/Music                                    \
                    /home/hujh/Pictures                                 \
                    /home/hujh/Projects                                 \
                    /home/hujh/Public                                   \
                    /home/hujh/Templates                                \
                    /home/hujh/Videos                                   \
                        /media/hujh/ypan/backup/latitude'
alias backup='rsync --archive --verbose --recursive --delete --rsh=ssh  \
                --exclude=*.class                                       \
                --exclude=*.pyc                                         \
                --exclude=*.o                                           \
                    /home/hujh/Codes                                    \
                    /home/hujh/Desktop                                  \
                    /home/hujh/Documents                                \
                    /home/hujh/Downloads                                \
                    /home/hujh/Music                                    \
                    /home/hujh/Pictures                                 \
                    /home/hujh/Projects                                 \
                    /home/hujh/Public                                   \
                    /home/hujh/Templates                                \
                    /home/hujh/Videos                                   \
                    root@gala:/volume1/homes/hujh/backup/latitude'

# vim: filetype=sh
