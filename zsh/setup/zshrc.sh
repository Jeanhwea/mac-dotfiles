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

# add this line to local .zshrc to enable this feature
# [ -f ~/.zsh/setup/zshrc.sh ] && source ~/.zsh/setup/zshrc.sh

__source_if_exists() {
    if [ "$#" -ne 1 ]; then
        return -1
    fi
    local script_path=$1
    [ -f $1 ] && source $1
}

# load zsh autoload directory
__zsh_setup_tools() {
    local autodir=$HOME'/.zsh/autoload'
    [[ ! -e $autodir ]] && return -1
    for script in $(ls $autodir/*.sh); do
        source $script
    done
    local execdir=$HOME'/.zsh/tools'
    [[ -e $execdir ]] && export PATH=$execdir:$PATH
}
__zsh_setup_tools

# vim: filetype=sh :
