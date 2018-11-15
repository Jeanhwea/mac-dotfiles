let $VIMFILES = expand('~').'/.vim'

" environment variables {{{1

let $PDICT  = $VIMFILES . '/dict'
let $PSPELL = $VIMFILES . '/spell'
let $PTAGS  = $VIMFILES . '/tags'

" }}}

" personal settings {{{1

" must set first
if &compatible | set nocompatible | endif
set runtimepath=$VIMFILES/bundle/pathogen,$VIMFILES,$VIM,$VIMRUNTIME,$VIMFILES/after
let mapleader="\\"
let g:mapleader="\\"
let maplocalleader=","
let g:maplocalleader=","

execute pathogen#infect()
syntax on
filetype plugin indent on

" plugins related settings {{{0
" "repeat"
silent! call repeat#set('\<Plug>MyWonderfulMap', v:count)

" "fugitive"
set statusline=[%n%R%W]\ %<%M%f\ %h%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
let g:fugitive_github_domains = [
\ 'https://code.csdn.net',
\ 'https://gitlab.com',
\]

" "utilsnips". Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit           = 'vertical'
" let g:ultisnips_java_brace_style   = "nl"
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.vim/bundle/ultisnips-snippets']

" "plasticboy/vim-markdown"
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_fenced_languages = [
\ 'java',
\ 'html',
\ 'javascript',
\ 'css',
\ 'cpp',
\ 'csharp=cs',
\ 'viml=vim',
\ 'bash=sh'
\]

" "signify"
let g:signify_disable_by_default = 1
let g:signify_vcs_list = [ 'git' , 'hg' ]

" "gundo"
let g:gundo_help = 0

" "auto-pairs"
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" "ctrlp"
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPFunky'
let g:ctrlp_working_path_mode = 'ra'
if has('win32')||has('win64')
  set wildignore+=*\\.git\\*,*.swp,*.zip,*.exe  " Windows
elseif has('unix')
  set wildignore+=*/.git/*,*.so,*.swp,*.zip     " Linux/MacOSX
endif
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': '',
\}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_funky_syntax_highlight = 1


" "syntastic"
let g:loaded_syntastic_plugin = 1
" set statusline+=%#ErrorMsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_mode_map = {
\ 'mode': 'passive',
\ 'active_filetypes': ['ruby', 'php', 'python'],
\ 'passive_filetypes': []
\}
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" "gitgutter" turn off by default
let g:gitgutter_enabled = 0

" 'hdima/python-syntax'
let python_highlight_all = 1

" "lastpath"
" only load lastpath on windows gvim
if !((has('win32')||has('win64')) && has('gui'))
  let g:loaded_lastpath = 1
endif

" log file path
" for h.vim => h#log()
let g:h_log_file = $VIMFILES.'/tmp/vimplugin.log'
" }}}
" install bundles by Vundle
" if filereadable(expand($VIMFILES."/setup/bundles.vim"))
"   source $VIMFILES/setup/bundles.vim
"   source $VIMFILES/setup/plugins.vim
" endif

" boolean options
set autoindent
set autoread
set autowrite "Automatically save before commands like :next and :make
set hidden
set list ruler
set modeline
set backup undofile
set nocursorline nocursorcolumn
set nowrap nospell
set incsearch" Incremental search

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
if has('clipboard') | set clipboard=unnamed | endif
if has('unix')
  let &backupdir = $HOME.'/.vim/tmp/backup,/tmp,.'
  let &undodir = $HOME.'/.vim/tmp/undo,/tmp,.'
  let &directory = $HOME.'/.vim/tmp/swap,/tmp,.'
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

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Underline in replace mode
endif

if &t_Co==256
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has('gui')&&has('gui_running')
  set background=light
  colorscheme solarized
else
  " let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  set background=dark
  colorscheme solarized
endif

" }}}


" autocmd related settings {{{1
if has('autocmd')
  filetype plugin indent on

  augroup MsicOption
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
    autocmd Bufnew,BufRead *.ts setlocal filetype=javascript
  augroup END

  augroup FTDictionary
    autocmd!
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
  augroup END

endif "has('autocmd')

" }}}

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

" }}}


" vim:set foldmethod=marker spell:
