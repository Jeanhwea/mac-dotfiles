if exists('g:loaded_basic') || &cp || v:version < 700
  finish
endif
let g:loaded_basic = 1

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
  set synmaxcol=800
endif

" Use :help 'option' to see the documentation for the given option.
set hidden
set nowrap
set autoindent
set backspace=indent,eol,start
set virtualedit=block
set complete-=i
set completeopt=longest,menu,preview
set commentstring=\/\/\ %s

set smarttab
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set nrformats-=octal

set timeoutlen=1000
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2 " show the status line all the time
set ruler
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*~,*.class,*.pyc,*.png,*.jpg,*.gif,*.xpm,*.tiff

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,default,latin1

set helplang=en
language messages en_US.utf-8 " set messages to English

" list of list char
set list
if (&termencoding==#'utf-8'||&encoding==#'utf-8') && version >= 700
  " tab:▸ ,trail:␣
  let &listchars = "tab:\u25b8\u0020,trail:\u2423"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread
set autowrite "Automatically save before commands like :next and :make

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

if has('clipboard')
  set clipboard=unnamed
endif

if executable('grep')
  set grepprg=grep\ -rnH\
        \ --exclude='*.swp'\
        \ --exclude='*~'\
        \ --exclude='cscope.files'\
        \ --exclude='cscope.out'\
        \ --exclude='tags'\
        \ --exclude-dir='.git'
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

if &t_Co==256
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Underline in replace mode
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
