" "repeat"
silent! call repeat#set('\<Plug>MyWonderfulMap', v:count)

" "figitive"
set statusline=[%n%R%W]\ %<%M%f\ %h%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
let g:fugitive_github_domains = [
\ 'https://code.csdn.net',
\ 'http://git.yanbozhongxin.com',
\ 'http://git.lejent.cn',
\]

" "utilsnips". Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit           = 'vertical'
let g:ultisnips_java_brace_style   = "nl"
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.vim/bundle/vim-ultisnips-snippets']

" "plasticboy/vim-markdown"
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
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


