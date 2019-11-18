################################################################################
#  _
# | |___
# | / __|
# | \__ \
# |_|___/
################################################################################
alias ll='ls -alF'
alias lh='ls -ahlF'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lsl='ls -alF `find $(pwd) -type l`'


################################################################################
#  _____ __  __ _   ___  __
# |_   _|  \/  | | | \ \/ /
#   | | | |\/| | | | |\  /
#   | | | |  | | |_| |/  \
#   |_| |_|  |_|\___//_/\_\
################################################################################
alias t='tmux list-sessions'
alias ta='tmux attach -t Jinghui || tmux new-session -s Jinghui'
alias td='tmux detach'


alias cg='cd $(git rev-parse --show-toplevel)'
