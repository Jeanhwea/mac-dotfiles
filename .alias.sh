alias ll='ls -alF'
alias lh='ls -ahlF'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lsl='ls -alF `find $(pwd) -type l`'

alias t='tmux list-sessions'
alias ta='tmux attach -t Jinghui || tmux new-session -s Jinghui'
alias td='tmux detach'

alias r='ranger'
alias em='emacsclient -n'
alias jc="java -jar ~/.emacs.d/resource/javarepl-428.jar"
alias cg='cd $(git rev-parse --show-toplevel)'
alias sp='rlwrap -c sqlplus'
