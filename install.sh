#!/usr/bin/env bash
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

HERE=`dirname $(realpath $0)`


__symbolic_link_file() {
    [ $# -ne 2 ] && return ;
    local src="$HOME/$1"
    local des="$HERE/$2"
    if [ -f $des ] && [ ! -e $src ]; then
        echo "ln -s $des $src"
        ln -s $des $src
    fi
}

__symbolic_link_folder() {
    [ $# -ne 2 ] && return ;
    local src="$HOME/$1"
    local des="$HERE/$2"
    if [ -d $des ] && [ ! -e $src ]; then
        echo "ln -s $des $src"
        ln -s $des $src
    fi
}


# bash
__symbolic_link_folder '.bash' 'bash'

# zsh
__symbolic_link_folder '.zsh' 'zsh'

# vim
__symbolic_link_file '.vimrc' 'vim/vimrc'
__symbolic_link_folder '.vim' 'vim'

# git
__symbolic_link_file '.gitconfig' 'git/gitconfig'
__symbolic_link_file '.gitignore_global' 'git/gitignore_global'
__symbolic_link_file '.gitattributes_global' 'git/gitattributes_global'

# emacs
__symbolic_link_folder 'emacs' '.emacs.d'

# tmux
__symbolic_link_file '.tmux.conf' 'tmux.conf'

# readline
__symbolic_link_file '.inputrc' 'inputrc'
__symbolic_link_file '.curlrc' 'curlrc'

# ctags
__symbolic_link_file '.ctags' 'ctags'

# mplayer
__symbolic_link_folder '.mplayer' 'mplayer'
