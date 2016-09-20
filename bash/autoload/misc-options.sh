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

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=20000
export HISTFILESIZE=40000

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# for setting history time stamp format
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S> "

# for setting history ignored commands
# export HISTIGNORE="cd*:cl*:ls*:ll*:la*:lt*:vim*:git*:history*:man*"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting 256 color terminal
export TERM="xterm-256color"

# I prefer using vim as my default editor
export EDITOR="vim"

# disable the Ctrl-S (Freeze Screen) keystroke in Bash
stty -ixon

# "fix problem" IntelliJ IDEA can't open settings through shortcut on Ubuntu 14.01 LTS
# https://youtrack.jetbrains.com/issue/IDEA-150886
# export IBUS_ENABLE_SYNC_MODE=1

# using tsinghua mirror for homebrew 

