#!/usr/bin/env sh

# install homebrew
if [ ! -x "/usr/local/bin/brew" ]; then
  open "https://brew.sh"
  # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  exit 1
fi

# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  open "https://ohmyz.sh"
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  exit 1
fi

# setup dotfiles
export DOTFILES="$HOME/.dotfiles"
if [ ! -d $DOTFILES ]; then
  git clone https://github.com/Jeanhwea/dotfiles.git $DOTFILES
fi

__linkfile() {
  local src="$HOME/$1"
  local des="$DOTFILES/$1"
  if [ -f $des ] && [ ! -e $src ]; then
    echo "ln -s $des $src"
    ln -s $des $src
  fi
}

__linkdir() {
  local src="$HOME/$1"
  local des="$DOTFILES/$1"
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
if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/vundle"
fi

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

# npm & yarn
__linkfile '.npmrc'
__linkfile '.yarnrc'

# install software

brew update


_mkdirp() {
  local dir=$1
  if [ ! -d $dir ]; then
    mkdir -p $dir
  fi
}


brew install coreutils moreutils
brew install python python3 ruby
brew install git tmux pandoc graphviz ffmpeg mplayer htop node maven p7zip reattach-to-user-namespace springboot
brew install tree unrar yarn you-get

brew install emacs --with-modules --with-cocoa --with-librsvg --with-mailutils --with-imagemagick@6

brew cask install iterm2
brew cask install macvim
brew cask install emacs
brew cask install macpass
