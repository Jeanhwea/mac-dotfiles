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
BUNDLE=$HOME/.vim/bundle
# __git_clone "https://github.com/VundleVim/Vundle.vim.git" "$BUNDLE/vundle"
__git_clone "https://github.com/tpope/vim-pathogen.git" "$BUNDLE/pathogen"
__git_clone "https://github.com/tpope/vim-abolish.git" "$BUNDLE/abolish"
__git_clone "https://github.com/tpope/vim-commentary.git" "$BUNDLE/commentary"
__git_clone "https://github.com/tpope/vim-fugitive.git" "$BUNDLE/fugitive"
__git_clone "https://github.com/tpope/vim-rhubarb.git" "$BUNDLE/rhubarb"
__git_clone "https://github.com/tpope/vim-repeat.git" "$BUNDLE/repeat"
__git_clone "https://github.com/tpope/vim-scriptease.git" "$BUNDLE/scriptease"
__git_clone "https://github.com/tpope/vim-surround.git" "$BUNDLE/surround"
__git_clone "https://github.com/tpope/vim-unimpaired.git" "$BUNDLE/unimpaired"
__git_clone "https://github.com/tpope/vim-dispatch.git" "$BUNDLE/dispatch"
__git_clone "https://github.com/tpope/vim-eunuch.git" "$BUNDLE/eunuch"
__git_clone "https://github.com/ctrlpvim/ctrlp.vim.git" "$BUNDLE/ctrlp"
__git_clone "https://github.com/tacahiroy/ctrlp-funky.git" "$BUNDLE/ctrlp-funky"
__git_clone "https://github.com/majutsushi/tagbar.git" "$BUNDLE/tagbar"
__git_clone "https://github.com/sjl/gundo.vim.git" "$BUNDLE/gundo"
__git_clone "git@github.com:Jeanhwea/vim-matchit.git" "$BUNDLE/matchit"
__git_clone "https://github.com/airblade/vim-gitgutter.git" "$BUNDLE/gitgutter"
__git_clone "https://github.com/mileszs/ack.vim.git" "$BUNDLE/ack"
__git_clone "https://github.com/rking/ag.vim.git" "$BUNDLE/ag"
__git_clone "https://github.com/godlygeek/tabular.git" "$BUNDLE/tabular"
__git_clone "https://github.com/tommcdo/vim-exchange.git" "$BUNDLE/exchange"
__git_clone "https://github.com/kana/vim-textobj-user.git" "$BUNDLE/textobj-user"
__git_clone "https://github.com/jceb/vim-textobj-uri.git" "$BUNDLE/textobj-uri"
__git_clone "https://github.com/sgur/vim-textobj-parameter.git" "$BUNDLE/textobj-parameter"
__git_clone "https://github.com/bps/vim-textobj-python.git" "$BUNDLE/textobj-python"
__git_clone "git@github.com:Jeanhwea/vim-ultisnips-snippets.git" "$BUNDLE/ultisnips-snippets"
__git_clone "https://github.com/SirVer/ultisnips.git" "$BUNDLE/ultisnips"
__git_clone "https://github.com/scrooloose/syntastic.git" "$BUNDLE/syntastic"
__git_clone "https://github.com/altercation/vim-colors-solarized.git" "$BUNDLE/colorscheme-solarized"
__git_clone "git@github.com:Jeanhwea/vim-viz.git" "$BUNDLE/syntax-viz"
__git_clone "https://github.com/plasticboy/vim-markdown.git" "$BUNDLE/syntax-markdown"
__git_clone "https://github.com/hdima/python-syntax.git" "$BUNDLE/syntax-python"
__git_clone "https://github.com/tpope/vim-rails.git" "$BUNDLE/rails"
__git_clone "https://github.com/fs111/pydoc.vim.git" "$BUNDLE/pydoc"

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
