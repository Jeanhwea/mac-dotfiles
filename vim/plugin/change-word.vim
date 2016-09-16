"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2016-06-11                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <LocalLeader>cw :call <SID>ChangeWord('n')<CR>
vnoremap <silent> <LocalLeader>cw :<C-U>call <SID>ChangeWord('v')<CR>

function! s:ChangeWord(mode)
    " get source word
    if a:mode ==# 'n'
        let l:srcWord = expand('<cword>')
    elseif a:mode ==# 'v'
        let l:saved_register = @c
        normal! gv"cy
        let l:srcWord = @c
        let @c = l:saved_register
    endif
    let l:srcWord = substitute(escape(l:srcWord, '/\'), '\n', '\\n', 'g')
    " get destination word
    let l:desWord = input('[' . l:srcWord . '] -> ')
    " execute command, save last changed word to register @c
    if l:srcWord !=# '' && l:desWord !=# ''
        execute ':'.line('.').',$substitute/\V'.l:srcWord.'/'.l:desWord.'/gc'
        let @c = l:srcWord
    endif
endfunction


