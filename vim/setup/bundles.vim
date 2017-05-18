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
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'

" utils
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'Jeanhwea/vim-matchit'

" productivity
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'tommcdo/vim-exchange'
" https://github.com/kana/vim-textobj-user/wiki
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
Plugin 'jceb/vim-textobj-uri'
Plugin 'kana/vim-textobj-function'
Plugin 'sgur/vim-textobj-parameter'

" better programming, let vim knows codes
Plugin 'Jeanhwea/vim-ultisnips-snippets'
Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

" colorscheme
Plugin 'AlessandroYorba/Despacio'
Plugin 'AlessandroYorba/Sierra'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'Valloric/vim-valloric-colorscheme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cocopon/iceberg.vim'
Plugin 'dracula/vim'
Plugin 'fneu/breezy'
Plugin 'joshdick/onedark.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'lu-ren/SerialExperimentsLain'
Plugin 'nanotech/jellybeans.vim'
Plugin 'raphamorim/lucario'
Plugin 'sickill/vim-monokai'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'vim-scripts/BusyBee'
Plugin 'vim-scripts/darkspectrum'
Plugin 'w0ng/vim-hybrid'
Plugin 'zanglg/nova.vim'
Plugin 'jnurmine/Zenburn'

" syntax highlight and so on
Plugin 'Jeanhwea/vim-viz'
Plugin 'plasticboy/vim-markdown'
Plugin 'hdima/python-syntax'
" Plugin 'tpope/vim-markdown'

" framework
Plugin 'tpope/vim-rails'
Plugin 'fs111/pydoc.vim'

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
