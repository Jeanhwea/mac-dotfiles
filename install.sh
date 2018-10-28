#!/usr/bin/env sh
HERE=`cd $(dirname $0); pwd`

export DOTFILES="$HOME/.dotfiles"

if [ ! -d $DOTFILES ]; then
  git clone https://github.com/Jeanhwea/dotfiles.git $DOTFILES
fi

__linkfile() {
  local src="$HOME/$1"
  local des="$HERE/$1"
  if [ -f $des ] && [ ! -e $src ]; then
    echo "ln -s $des $src"
    ln -s $des $src
  fi
}

__linkdir() {
  local src="$HOME/$1"
  local des="$HERE/$1"
  if [ -d $des ] && [ ! -e $src ]; then
    echo "ln -s $des $src"
    ln -s $des $src
  fi
}

# zsh
__linkfile '.bashrc'
__linkfile '.zshrc'

# vim
__linkfile '.vimrc'
__linkdir '.vim'

# git
__linkfile '.gitconfig'
__linkfile '.gitignore_global'
__linkfile '.gitattributes_global'
__linkfile '.gitcommitmsg'


# tmux
__linkfile '.tmux.conf'

# readline
__linkfile '.inputrc'
__linkfile '.curlrc'

# ctags
__linkfile '.ctags'

# mplayer
__linkdir '.mplayer'
