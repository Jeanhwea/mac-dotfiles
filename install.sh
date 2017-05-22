#!/bin/bash
#########################################################################
#         _                          _                                  #
#        | |                        | |                                 #
#        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    #
#    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   #
#   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   #
#    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   #
#                                                                       #
#                                                                       #
# This is a personal dotfiles repository                                #
# It's free for you to use and share                                    #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
echo "DIR=$DIR"

__symbolic_link_file() {
    [ $# -ne 2 ] && return ;
    local DES=$DIR'/'$1
    local SRC=$HOME'/'$2
    if [ -f $DES ] && [ ! -e $SRC ]; then
        echo "ln -s $DES $SRC" && ln -s $DES $SRC
    fi
}

__symbolic_link_folder() {
    [ $# -ne 2 ] && return ;
    local DES=$DIR'/'$1
    local SRC=$HOME'/'$2
    if [ -d $DES ] && [ ! -e $SRC ]; then
        echo "ln -s $DES $SRC" && ln -s $DES $SRC
    fi
}

# readline
__symbolic_link_file 'inputrc' '.inputrc'
__symbolic_link_file 'curlrc' '.curlrc'

# bash
__symbolic_link_folder 'bash' '.bash'

# zsh
__symbolic_link_folder 'zsh' '.zsh'

# git
__symbolic_link_file 'git/gitconfig' '.gitconfig'
__symbolic_link_file 'git/gitignore_global' '.gitignore_global'
__symbolic_link_file 'git/gitattributes_global' '.gitattributes_global'

# vim
__symbolic_link_file 'vim/vimrc' '.vimrc'
__symbolic_link_folder 'vim' '.vim'

# tmux
__symbolic_link_file 'tmux.conf' '.tmux.conf'

# ctags
__symbolic_link_file 'ctags' '.ctags'

