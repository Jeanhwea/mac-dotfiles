#!/usr/bin/env sh
BRED="\033[01;31m"
BBLUE="\033[01;34m"
BGREEN="\033[01;32m"
DEFAULT="\033[00m"

__open_url() {
  local exe=$1
  local msg=$2
  local url=$3
  if [ ! -x `which $exe` ]; then
    echo "Install $BRED$msg$DEFAULT first, $BRED$url$DEFAULT"
    exit -1
  fi
}

__brew_install() {
  local pkg=$1
  if brew ls --versions $pkg > /dev/null 2>&1; then
    echo "==> $BBLUE$pkg$DEFAULT is already installed."
  else
    echo "==> brew install $BGREEN$pkg$DEFAULT"
    brew install $pkg
  fi
}

__brew_cask_install() {
  local pkg=$1
  if brew cask ls --versions $pkg > /dev/null 2>&1; then
    echo "==> $BBLUE$pkg$DEFAULT is already installed."
  else
    echo "==> brew cask install $BGREEN$pkg$DEFAULT"
    brew cask install $pkg
  fi
}

__brew_tap() {
  local tap=$1
  if brew tap | grep -q "^$tap\$"; then
    echo "==> $BBLUE$tap$DEFAULT is already added."
  else
    echo "==> brew tap $BGREEN$tap$DEFAULT"
  fi
}

__pip_install() {
  local pkg=$1
  if pip show -q $pkg > /dev/null 2>&1; then
    echo "==> $BBLUE$pkg$DEFAULT is already installed."
  else
    echo "==> pip install $BGREEN$pkg$DEFAULT"
    pip install $pkg
  fi
}

# install homebrew https://brew.sh
if [ ! -x "/usr/local/bin/brew" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# jdk
__open_url "javac" "JDK1.8" "https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

# tap for springboot
__brew_tap pivotal/tap

# install cli
__brew_install coreutils
__brew_install moreutils

__brew_install ccat
__brew_install cloc
__brew_install ffmpeg
__brew_install ghc
__brew_install git
__brew_install git-open
__brew_install global
__brew_install graphviz
__brew_install grip
__brew_install htop
__brew_install maven
__brew_install mplayer
__brew_install ncdu
__brew_install node
__brew_install p7zip
__brew_install pandoc
__brew_install python
__brew_install python3
__brew_install r
__brew_install readline
__brew_install reattach-to-user-namespace
__brew_install ruby
__brew_install springboot
__brew_install the_platinum_searcher
__brew_install the_silver_searcher
__brew_install tmux
__brew_install tree
__brew_install unrar
__brew_install wget
__brew_install yarn
__brew_install you-get
__brew_install zsh-autosuggestions


# install application
__brew_cask_install docker
__brew_cask_install emacs
__brew_cask_install foxmail
__brew_cask_install google-chrome
__brew_cask_install iterm2
__brew_cask_install lantern
__brew_cask_install macpass
__brew_cask_install mactex
__brew_cask_install macvim
__brew_cask_install qq
__brew_cask_install visual-studio-code
__brew_cask_install vlc
__brew_cask_install wechat

# osxfuse should installed before ntfs-3g
__brew_cask_install osxfuse
__brew_install ntfs-3g


# install python package
__pip_install ipdb
__pip_install pep8
__pip_install pygments
__pip_install pylint
__pip_install requests
__pip_install rope
__pip_install virtualenv
