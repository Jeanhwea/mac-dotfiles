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
# This file create on 2016-06-22                                        #
# It's free for you to use and share.                                   #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

git_ps1() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

set_bash_ps1() {
    # bash color - bold
    local BBLACK="\e[01;30m"
    local BRED="\e[01;31m"
    local BGREEN="\e[01;32m"
    local BYELLOW="\e[01;33m"
    local BBLUE="\e[01;34m"
    local BPURPLE="\e[01;35m"
    local BCYAN="\e[01;36m"
    local BWHITE="\e[01;37m"
    # bash color - normal
    local BLACK="\e[00;30m"
    local RED="\e[00;31m"
    local GREEN="\e[00;32m"
    local YELLOW="\e[00;33m"
    local BLUE="\e[00;34m"
    local PURPLE="\e[00;35m"
    local CYAN="\e[00;36m"
    local WHITE="\e[00;37m"
    # bash color default
    local DEFAULT="\e[00m"
    # set PS1
    PS1="\[$BRED\]^\j^ "
    PS1=$PS1"\[$WHITE\][\[$BBLUE\]\$OLDPWD\[$WHITE\]]"
    PS1=$PS1"->"
    PS1=$PS1"[\[$GREEN\]\u@\H:\[$BBLUE\]\w\[$BYELLOW\]\$(git_ps1)\[$WHITE\]]"
    PS1=$PS1" \[$PURPLE\]\D{%Y-%m-%d %H:%M:%S}\n"
    PS1=$PS1"\[$BCYAN\]\\$ "
    PS1=$PS1"\[$DEFAULT\]"
}

set_bash_ps1

