################################################################################
# Section 1: Comfortable Environment

# setup zsh-autosuggestions.zsh
# 1. git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 2. add plugins=(zsh-autosuggestions) to ~/.zshrc
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# let git log page more friendly
export LESS="-F -X $LESS"

# list files
alias ll='ls -alF'
alias lh='ls -ahlF'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lsl='ls -alF `find $(pwd) -type l`'

# tmux
alias t='tmux list-sessions'
alias ta='tmux attach -t Jinghui || tmux new-session -s Jinghui'
alias td='tmux detach'

# python & anaconda
export PYTHONDONTWRITEBYTECODE=1
export PYTHONPATH=.${PYTHONPATH:+:${PYTHONPATH}}
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export CONDA_HOME=${CONDA_HOME:-/usr/local/anaconda3}
export PATH="$PATH:$CONDA_HOME/bin"
alias py="$CONDA_HOME/bin/python"
alias ipy="$CONDA_HOME/bin/ipython"
alias nb="jupyter notebook"
alias b0="source $CONDA_HOME/bin/deactivate"
alias b1="source $CONDA_HOME/bin/activate"

# postgres
export PGHOME=${PGHOME:-/usr/local/pgsql}
export PGDATA=$PGHOME/data
export PATH=$PGHOME/bin:$PATH
export PGUSER=${PGUSER:-postgres}
export PGDATABASE=${PGDATABASE-postgres}
export PGPORT=${PGPORT-5432}
alias cdph="cd $PGHOME"
alias p0="$PGHOME/bin/pg_ctl stop"
alias p1="$PGHOME/bin/pg_ctl -D $PGDATA -l $PGDATA/logfile start"

# java
export JAVA_HOME=${JAVA_HOME:-/usr/local/java/jdk1.8.0_191}
export MAVEN_HOME=${MAVEN_HOME:-/usr/local/java/apache-maven-3.6.3}
export HADOOP_HOME=${HADOOP_HOME:-/usr/local/java/hadoop-2.7.7}
export HADOOP_DATA="$HADOOP_HOME/data"
export PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin:$PATH"
alias jc="java -jar ~/.emacs.d/resource/javarepl-428.jar"
alias cdhh="cd $HADOOP_HOME"
alias h0="$HADOOP_HOME/sbin/stop-all.sh"
alias h1="$HADOOP_HOME/sbin/start-all.sh"

################################################################################
# Section 2: Better Download Experience

# change homebrew bottle domain
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# taobao mirror for npm
export CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export PHANTOMJS_CDNURL=http://npm.taobao.org/mirrors/phantomjs
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
export SELENIUM_CDNURL=http://npm.taobao.org/mirrorss/selenium
export SQLITE3_BINARY_SITE=http://npm.taobao.org/mirrors/sqlite3


################################################################################
# Section 3: Localization

# setup sqlplus to chinese simplified
# export NLS_LANG="SIMPLIFIED CHINESE_CHINA.AL32UTF8"
export NLS_LANG='AMERICAN_AMERICA.AL32UTF8'
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'


################################################################################
# Section 4: Misc
alias r='ranger'
alias em='emacsclient -n'
alias cg='cd $(git rev-parse --show-toplevel)'
alias sp='rlwrap -c sqlplus'
