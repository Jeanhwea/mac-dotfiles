"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2016-06-14                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:ToggleSearchOption()
    if &hlsearch
        set nohlsearch
        set noincsearch
    else
        set hlsearch
        set incsearch
    endif
endfunction
noremap <LocalLeader>ts :call <SID>ToggleSearchOption()<CR>

function! s:ToggleNumberOption()
    if &relativenumber
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunction
noremap <LocalLeader>tn :call <SID>ToggleNumberOption()<CR>

function! s:ToogleSpellOption()
    if &spell
        set nospell
    else
        set spell
    endif
endfunction
" nnoremap <LocalLeader>tj :set spell!<CR>
nnoremap <LocalLeader>tj :call <SID>ToogleSpellOption()<CR>

" plugins toggle option
nnoremap <LocalLeader>tc :SignifyToggle<CR>
nnoremap <LocalLeader>tr :RainbowToggle<CR>
nnoremap <LocalLeader>tt :TagbarToggle<CR>
nnoremap <LocalLeader>tu :GundoToggle<CR>
nnoremap <LocalLeader>st :SyntasticToggleMode<CR>

