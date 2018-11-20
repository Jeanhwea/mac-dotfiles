if exists('g:loaded_desktop') || &cp || v:version < 700
  finish
endif
let g:loaded_desktop = 1

" the modeline settings
set textwidth=80
set modeline
set colorcolumn=+1
set nocursorline nocursorcolumn

set backup
set undofile
set undolevels=1000
if has('unix')
  let &backupdir="$HOME/.vim/tmp/backup,/tmp,."
  let &undodir="$HOME/.vim/tmp/undo,/tmp,."
  let &directory="$HOME/.vim/tmp/swap,/tmp,."
endif

set dictionary+=$VIMFILES/dict/words.dict

set nospell
set spelllang=en_us
let &spellfile = expand($VIMFILES.'/spell/personal.utf-8.add,') .
               \ expand($VIMFILES.'/spell/nonwords.utf-8.add')

if has('gui')&&has('gui_running')
  set background=light
  colorscheme solarized
endif

set guioptions=gm
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
        \ :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller
        \ :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif

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

" vim:set ft=vim et sw=2:
