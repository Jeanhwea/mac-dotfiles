"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This vimrc.vim file is a personal vim configuration file.             "
" It's free for you to use and share                                    "
"                                                                       "
" author : Jinghui Hu                                                   "
" email  : hujinghui@buaa.edu.cn                                        "
" github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('$VIMFILES') | finish | endif

" environment variables {{{1

let $PDICT  = $VIMFILES . '/dict'
let $PSPELL = $VIMFILES . '/spell'
let $PTAGS  = $VIMFILES . '/tags'

" }}}

" personal settings {{{1

" must set first
if &compatible | set nocompatible | endif
set runtimepath=$VIMFILES,$VIM,$VIMRUNTIME,$VIMFILES/after
let mapleader="\\"
let g:mapleader="\\"
let maplocalleader=","
let g:maplocalleader=","

" install bundles by Vundle
if filereadable(expand($VIMFILES."/setup/bundles.vim"))
    source $VIMFILES/setup/bundles.vim
    source $VIMFILES/setup/plugins.vim
endif

" boolean options
set list
set ruler
set modeline
set cursorline
set cursorcolumn
set hidden
set backup
set nowrap
set nospell
set undofile

" numerical options
set laststatus=2 " show the status line all the time
set history=1000
set timeoutlen=1000
set ttimeoutlen=10
set textwidth=100
set colorcolumn=+1
set synmaxcol=800
set undolevels=1000
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" string options
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set printoptions=paper:letter
set commentstring=\/\/\ %s
set virtualedit=block
set wildmode=list:longest,full
set backspace=indent,eol,start
set wildignore+=*.o,*.obj,*~,*.class,*.pyc
set wildignore+=*.png,*.jpg,*.gif,*.xpm,*.tiff
set spelllang=en_us
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview
set dictionary+=$PDICT/words.dict
let &spellfile = expand($PSPELL . '/personal.utf-8.add,') .
               \ expand($PSPELL . '/nonwords.utf-8.add')

if (&termencoding==#'utf-8'||&encoding==#'utf-8') && version >= 700
    " tab:▸ ,trail:␣
    let &listchars = "tab:\u25b8\u0020,trail:\u2423"
else
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
if has('unix')
    if has('clipboard') | set clipboard=unnamed,unnamedplus | endif
    " all temporary directory has layout as follow
    " using .vim/tmp as temporary folder store
    set backupdir=~/.vim/tmp/backup,~/tmp,.
    set undodir=~/.vim/tmp/undo,~/tmp,.
    set directory=~/.vim/tmp/swap,~/tmp,.
elseif has('win32')||has('win64')
    if has('clipboard') | set clipboard=unnamed | endif
    set backupdir=~/vimtemp,$TMEP,.
endif

if executable('ctags') " generate ctags files
    nnoremap <LocalLeader>gt :silent !ctags .<CR>:redraw!<CR>
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

if has('syntax') | syntax on | endif
if &t_Co==256
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
    " let g:solarized_termcolors=256
    " let g:solarized_termtrans=1
    set background=dark
    colorscheme solarized
endif
if has('gui')&&has('gui_running')
    set background=dark
    colorscheme solarized
endif

"}}}

" autocmd related settings {{{1

if has('autocmd')
    filetype plugin indent on

    augroup Msic
        autocmd!
        autocmd FileType help,qf nnoremap <silent><buffer> q :q<CR>
        " Return to last edit position
        autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \     exe "normal! g`\"" |
              \ endif
    augroup END

    augroup FTDetect
        autocmd!
        autocmd Bufnew,BufRead *.md setlocal filetype=markdown
        autocmd Bufnew,BufRead *.sql setlocal filetype=mysql
    augroup END

    augroup FTOptions
        autocmd!
        " set tabstop softtabstop shiftwidth expandtab/noexpandtab {{{2
        autocmd FileType vim
              \ setlocal ts=2 sts=2 sw=2 et
        autocmd FileType text,markdown
              \ setlocal ts=4 sts=4 sw=4 noet
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noet
        " }}}
        " set cindent autoindent {{{2
        autocmd FileType c,cpp,java                         setlocal cin ai
        autocmd FileType python,vim,javascript,html,xml,css setlocal nocin ai
        autocmd FileType text,markdown                      setlocal nocin noai
        " }}}
        " set list {{{2
        autocmd FileType text,markdown setlocal nolist
        " }}}
        " set commentstring {{{2
        autocmd FileType sql,mysql  setlocal cms=--\ %s
        autocmd FileType viz        setlocal cms=\'\ %s
        autocmd FileType gdb        setlocal cms=#\ %s
        " }}}
        " set wrap {{{2
        autocmd FileType text setlocal wrap
        " }}}
        " set cursorline cursorcolumn colorcolumn {{{2
        autocmd FileType help,fugitiveblame setlocal nocul nocuc cc&
        " }}}
        " set dictionary {{{2
        autocmd FileType c          setlocal dict+=$PDICT/c.dict
        autocmd FileType cpp        setlocal dict+=$PDICT/c.dict
        autocmd FileType cs         setlocal dict+=$PDICT/cs.dict
        autocmd FileType css        setlocal dict+=$PDICT/css.dict
        autocmd FileType html       setlocal dict+=$PDICT/html.dict
        autocmd FileType java       setlocal dict+=$PDICT/java.dict
        autocmd FileType javascript setlocal dict+=$PDICT/javascript.dict
        autocmd FileType node       setlocal dict+=$PDICT/node.dict
        autocmd FileType php        setlocal dict+=$PDICT/php.dict
        autocmd FileType python     setlocal dict+=$PDICT/python.dict
        autocmd FileType ruby       setlocal dict+=$PDICT/ruby.dict
        autocmd FileType tex        setlocal dict+=$PDICT/tex.dict
        autocmd FileType vim        setlocal dict+=$PDICT/vim.dict
        autocmd FileType viz        setlocal dict+=$PDICT/viz.dict
        " }}}
    augroup END
endif "has('autocmd')

" GUI related settings {{{1

" remove toolbar, scrolling bar, menu
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r

if exists('&guifont')
    if has('mac')
        set guifont=Monaco:h12
    elseif has('unix')
        set guifont=Monospace\ Medium\ 10
    elseif has('win32')||has('win64')
        " set guifont=Courier\ New:h10
        set guifont=Consolas:h11
    endif
    command! -bar -nargs=0 Bigger
        \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
    command! -bar -nargs=0 Smaller
        \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif

" set messages to English
if has('win32')||has('win64')
    language messages en_US.utf-8
endif
"}}}


" vim:set foldmethod=marker spell:
