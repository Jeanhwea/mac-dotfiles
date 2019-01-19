#!/usr/bin/env sh
export DOTFILES="$HOME/.dotfiles"

BRED="\033[01;31m"
BBLUE="\033[01;34m"
BGREEN="\033[01;32m"
DEFAULT="\033[00m"

__linkfile() {
  local src="$HOME/$1"
  local des="$DOTFILES/$1"
  if [ -f $des ] && [ ! -e $src ]; then
    echo "==> Link $BGREEN$src$DEFAULT"
    ln -s $des $src
  else
    echo "==> $BBLUE$src$DEFAULT is already linked."
  fi
}

__linkdir() {
  local src="$HOME/$1"
  local des="$DOTFILES/$1"
  if [ -d $des ] && [ ! -e $src ]; then
    echo "==> Link $BGREEN$src/$DEFAULT"
    ln -s $des $src
  else
    echo "==> $BBLUE$src/$DEFAULT is already linked."
  fi
}

__git_clone() {
  local url=$1
  local des=$2
  if [ ! -d $des ]; then
    echo "==> git clone $BBLUE$url$DEFAULT $des"
    git clone $url $des
  fi
}

# install oh-my-zsh https://ohmyz.sh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

__git_clone "git@github.com:Jeanhwea/dotfiles.git" "$HOME/.dotfiles"

# zsh
__linkfile .bashrc
__linkfile .zshrc

# vim
__linkfile .vimrc
__linkdir .vim

# git
__linkfile .gitconfig
__linkfile .gitignore_global
__linkfile .gitattributes_global
__linkfile .gitcommitmsg

# tmux
__linkfile .tmux.conf

# readline
__linkfile .inputrc
__linkfile .curlrc

# ctags
__linkfile .ctags

# mplayer
__linkdir .mplayer

# npm & yarn
__linkfile .npmrc
__linkfile .yarnrc

# python
# export PYTHONSTARTUP=$HOME/.pythonrc.py
__linkfile .pythonrc.py
