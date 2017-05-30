set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim', {'name': 'vundle'}

" tpope's powerful plugins https://github.com/tpope
Plugin 'tpope/vim-abolish', {'name': 'abolish'}
Plugin 'tpope/vim-commentary', {'name': 'commentary'}
Plugin 'tpope/vim-fugitive', {'name': 'fugitive'}
Plugin 'tpope/vim-rhubarb', {'name': 'rhubarb'}
Plugin 'tpope/vim-repeat', {'name': 'repeat'}
Plugin 'tpope/vim-scriptease', {'name': 'scriptease'}
Plugin 'tpope/vim-surround', {'name': 'surround'}
Plugin 'tpope/vim-unimpaired', {'name': 'unimpaired'}
Plugin 'tpope/vim-dispatch', {'name': 'dispatch'}

" utils
Plugin 'ctrlpvim/ctrlp.vim', {'name': 'ctrlp'}
Plugin 'tacahiroy/ctrlp-funky', {'name': 'ctrlp-funky'}
Plugin 'majutsushi/tagbar', {'name': 'tagbar'}
Plugin 'sjl/gundo.vim', {'name': 'gundo'}
Plugin 'Jeanhwea/vim-matchit', {'name': 'matchit'}
Plugin 'airblade/vim-gitgutter', {'name': 'gitgutter'}

" productivity
Plugin 'mileszs/ack.vim', {'name': 'ack'}
Plugin 'rking/ag.vim', {'name': 'ag'}
Plugin 'godlygeek/tabular', {'name': 'tabular'}
Plugin 'tommcdo/vim-exchange', {'name': 'exchange'}
" https://github.com/kana/vim-textobj-user/wiki
Plugin 'kana/vim-textobj-user', {'name': 'textobj-user'}
Plugin 'bps/vim-textobj-python', {'name': 'textobj-python'}
Plugin 'jceb/vim-textobj-uri', {'name': 'textobj-uri'}
Plugin 'kana/vim-textobj-function', {'name': 'textobj-function'}
Plugin 'sgur/vim-textobj-parameter', {'name': 'textobj-parameter'}

" better programming, let vim knows codes
Plugin 'Jeanhwea/vim-ultisnips-snippets', {'name': 'ultisnips-snippets'}
Plugin 'SirVer/ultisnips', {'name': 'ultisnips'}
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic', {'name': 'syntastic'}

" colorscheme
Plugin 'AlessandroYorba/Despacio', {'name': 'colorscheme-despacio'}
Plugin 'AlessandroYorba/Sierra', {'name': 'colorscheme-sierra'}
Plugin 'KeitaNakamura/neodark.vim', {'name': 'colorscheme-neodark'}
Plugin 'Valloric/vim-valloric-colorscheme', {'name': 'colorscheme-valloric'}
Plugin 'altercation/vim-colors-solarized', {'name': 'colorscheme-solarized'}
Plugin 'cocopon/iceberg.vim', {'name': 'colorscheme-iceberg'}
Plugin 'dracula/vim', {'name': 'colorscheme-dracula'}
Plugin 'endel/vim-github-colorscheme', {'name': 'colorscheme-github'}
Plugin 'fneu/breezy', {'name': 'colorscheme-breezy'}
Plugin 'jnurmine/Zenburn', {'name': 'colorscheme-zenburn'}
Plugin 'joshdick/onedark.vim', {'name': 'colorscheme-onedark'}
Plugin 'jpo/vim-railscasts-theme', {'name': 'colorscheme-railscasts'}
Plugin 'lu-ren/SerialExperimentsLain', {'name': 'colorscheme-SerialExperimentsLain'}
Plugin 'morhetz/gruvbox', {'name': 'colorscheme-gruvbox'}
Plugin 'nanotech/jellybeans.vim', {'name': 'colorscheme-jellybeans'}
Plugin 'raphamorim/lucario', {'name': 'colorscheme-lucario'}
Plugin 'sickill/vim-monokai', {'name': 'colorscheme-monokai'}
Plugin 'sjl/badwolf', {'name': 'colorscheme-badwolf'}
Plugin 'tomasr/molokai', {'name': 'colorscheme-molokai'}
Plugin 'tpope/vim-vividchalk', {'name': 'colorscheme-vividchalk'}
Plugin 'tyrannicaltoucan/vim-deep-space', {'name': 'colorscheme-deep-space'}
Plugin 'vim-scripts/BusyBee', {'name': 'colorscheme-BusyBee'}
Plugin 'vim-scripts/darkspectrum', {'name': 'colorscheme-darkspectrum'}
Plugin 'w0ng/vim-hybrid', {'name': 'colorscheme-hybrid'}
Plugin 'zanglg/nova.vim', {'name': 'colorscheme-nova'}

" syntax highlight and so on
Plugin 'Jeanhwea/vim-viz', {'name': 'syntax-viz'}
Plugin 'plasticboy/vim-markdown', {'name': 'syntax-markdown'}
Plugin 'hdima/python-syntax', {'name': 'syntax-python'}
" Plugin 'tpope/vim-markdown'

" framework
Plugin 'tpope/vim-rails', {'name': 'rails'}
Plugin 'fs111/pydoc.vim', {'name': 'pydoc'}

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
