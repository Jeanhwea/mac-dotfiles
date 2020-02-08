################################################################################
# Section 1: Comfortable Environment

# let git log page more friendly
export LESS="-F -X $LESS"

# setup zsh-autosuggestions.zsh
# 1. git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 2. add plugins=(zsh-autosuggestions) to ~/.zshrc
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# let python don't write byte code
export PYTHONDONTWRITEBYTECODE=1
# setup pip cache folder
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

################################################################################
# Section 2: Better Download Experience

# change homebrew bottle domain
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# taobao mirror for npm
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/
export SQLITE3_BINARY_SITE=http://npm.taobao.org/mirrors/sqlite3

################################################################################
# Section 3: Localization

# setup sqlplus to chinese simplified
# export NLS_LANG="SIMPLIFIED CHINESE_CHINA.AL32UTF8"
export NLS_LANG='AMERICAN_AMERICA.AL32UTF8'
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'
