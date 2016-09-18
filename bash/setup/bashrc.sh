#########################################################################
#         _                          _                                  #
#        | |                        | |                                 #
#        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    #
#    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   #
#   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   #
#    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   #
#                                                                       #
#                                                                       #
# This file create on 2016-06-21                                        #
# It's free for you to use and share.                                   #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

# add this line to local .bashrc
# [ -f ~/.bash/setup/bashrc.sh ] && source ~/.bash/setup/bashrc.sh

# load bash autoload directory
__bash_setup_tools() {
    local autodir=$HOME'/.bash/autoload'
    [[ ! -e $autodir ]] && return
    for script in $(ls $autodir/*.sh); do
        source $script
    done
    local execdir=$HOME'/.bash/tools'
    [[ -e $execdir ]] && export PATH=$execdir:$PATH
}
__bash_setup_tools

# entering last logout directory
if [ -f ~/.local/last_logout_path ]; then
    LASTPATH=`cat ~/.local/last_logout_path`
    if [ -e $LASTPATH ]; then
        cd $LASTPATH
    fi
    # cat /dev/null > ~/.local/last_logout_path
fi

# vim: filetype=sh :
