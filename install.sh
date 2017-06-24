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

# basic function #

__current_dir() {
    cd $(dirname "$0")
    pwd -P
}

__home_dir() {
    echo $HOME
}

__symbolic_link_file() {
    [ $# -ne 2 ] && return ;
    local target_file=$1
    local source_file=$2
    local target=$(__current_dir)'/'$target_file
    local source=$(__home_dir)'/'$source_file
    if [ -f $target ] && [ ! -e $source ]; then
        echo "ln -s $target $source" && ln -s $target $source
    fi
}

__symbolic_link_folder() {
    [ $# -ne 2 ] && return ;
    local target_file=$1
    local source_file=$2
    local target=$(__current_dir)'/'$target_file
    local source=$(__home_dir)'/'$source_file
    if [ -d $target ] && [ ! -e $source ]; then
        echo "ln -s $target $source" && ln -s $target $source
    fi
}

########## do link work

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

# mplayer
__symbolic_link_folder 'mplayer' '.mplayer'
