#!/usr/bin/env bash
BRED="\033[01;31m"
BBLUE="\033[01;34m"
BGREEN="\033[01;32m"
DEFAULT="\033[00m"

# __git_clone_bundle repo name
__git_clone_bundle() {
  local repo=$1
  local name=$2
  local des="$HOME/.vim/bundle/$name"
  if [[ $repo =~ ^Jeanhwea/.*$ ]]; then
    local url="git@github.com:${repo}.git"
  else
    local url="https://github.com/${repo}.git"
  fi
  if [ ! -d $des ]; then
    echo -e "==> git clone $BBLUE$url$DEFAULT $des"
    git clone $url $des
  else
    echo -e "==> $BBLUE$name$DEFAULT is already installed"
  fi
}

__git_clone_bundle tpope/vim-pathogen pathogen
__git_clone_bundle tpope/vim-abolish abolish
__git_clone_bundle tpope/vim-commentary commentary
__git_clone_bundle tpope/vim-endwise endwise
__git_clone_bundle tpope/vim-fugitive fugitive
__git_clone_bundle tpope/vim-rhubarb rhubarb
__git_clone_bundle tpope/vim-repeat repeat
__git_clone_bundle tpope/vim-scriptease scriptease
__git_clone_bundle tpope/vim-surround surround
__git_clone_bundle tpope/vim-unimpaired unimpaired
__git_clone_bundle tpope/vim-dispatch dispatch
__git_clone_bundle tpope/vim-eunuch eunuch
__git_clone_bundle Jeanhwea/vim-matchit matchit
__git_clone_bundle Jeanhwea/vim-ultisnips-snippets ultisnips-snippets
__git_clone_bundle Jeanhwea/vim-viz syntax-viz
__git_clone_bundle SirVer/ultisnips ultisnips
__git_clone_bundle airblade/vim-gitgutter gitgutter
__git_clone_bundle altercation/vim-colors-solarized colorscheme-solarized
__git_clone_bundle bps/vim-textobj-python textobj-python
__git_clone_bundle ctrlpvim/ctrlp.vim ctrlp
__git_clone_bundle fs111/pydoc.vim pydoc
__git_clone_bundle godlygeek/tabular tabular
__git_clone_bundle hdima/python-syntax syntax-python
__git_clone_bundle jceb/vim-textobj-uri textobj-uri
__git_clone_bundle kana/vim-textobj-user textobj-user
__git_clone_bundle majutsushi/tagbar tagbar
__git_clone_bundle mileszs/ack.vim ack
__git_clone_bundle plasticboy/vim-markdown syntax-markdown
__git_clone_bundle rking/ag.vim ag
__git_clone_bundle scrooloose/syntastic syntastic
__git_clone_bundle sgur/vim-textobj-parameter textobj-parameter
__git_clone_bundle sjl/gundo.vim gundo
__git_clone_bundle tacahiroy/ctrlp-funky ctrlp-funky
__git_clone_bundle tommcdo/vim-exchange exchange
__git_clone_bundle tpope/vim-rails rails
