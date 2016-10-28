#########################################################################
#         _                          _                                  #
#        | |                        | |                                 #
#        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    #
#    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   #
#   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   #
#    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   #
#                                                                       #
#                                                                       #
# This file create on 2016-10-28                                        #
# It's free for you to use and share.                                   #
#                                                                       #
# Author : Jinghui Hu                                                   #
# Email  : hujinghui@buaa.edu.cn                                        #
# Github : https://github.com/Jeanhwea/                                 #
#                                                                       #
#########################################################################

# setup libxml2 python library path
export PYTHONPATH=/usr/local/Cellar/libxml2/2.9.4/lib/python2.7/site-packages:$PYTHONPATH

# setup Tian Gong Xin Yuan environments
export CWPROOT=~/Tools/cwp/43R1
export PATH=$PATH:$CWPROOT/bin

export SACHOME=~/Tools/sac/101.6
__source_if_exists $SACHOME/bin/sacinit.sh

export FFTWHOME=~/Tools/fftw/3.3.5
export PATH=$PATH:$FFTWHOME/bin
