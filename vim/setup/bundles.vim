set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" tpope's powerful plugins https://github.com/tpope
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" utils
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'Jeanhwea/vim-matchit'

" productivity
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'tommcdo/vim-exchange'

" better programming, let vim knows codes
Plugin 'Jeanhwea/vim-ultisnips-snippets'
Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

" colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" syntax highlight and so on
Plugin 'Jeanhwea/vim-viz'
Plugin 'plasticboy/vim-markdown'

" framework
Plugin 'tpope/vim-rails'
Plugin 'fs111/pydoc.vim'
Plugin 'pangloss/vim-javascript'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
