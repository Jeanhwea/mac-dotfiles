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

" grep words in current directory
" register @g : store last grep string
function! s:GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>"gy
    elseif a:type ==# 'char'
        normal! `[v`]"gy
    else
        return
    endif
    silent execute 'grep! -R ' . shellescape(@g) . ' .'
    copen
    redraw!
endfunction

nnoremap <LocalLeader>f :setlocal operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <LocalLeader>f :<C-U>call <SID>GrepOperator(visualmode())<CR>

