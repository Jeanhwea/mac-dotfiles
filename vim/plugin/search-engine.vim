"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This is a personal code file,                                         "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:engines = {
\   'baidu'         : 'http://www.baidu.com/s?wd=%s',
\   'bing'          : 'http://global.bing.com/search?q=%s',
\   'github'        : 'http://github.com/search?q=%s',
\   'google'        : 'http://www.google.com/search?q=%s',
\   'maven'         : 'http://mvnrepository.com/search?q=%s',
\   'stackoverflow' : 'http://stackoverflow.com/search?q=%s',
\   'wikipedia'     : 'http://en.wikipedia.org/wiki/Special:Search?search=%s',
\   'dash'          : 'dash://%s',
\}

function! s:SearchWord(engine, mode)
    let l:saved_cursor = getpos('.')
    if a:mode ==# 'n'
        let l:word = expand('<cword>')
        let @s = l:word
    elseif a:mode ==# 'v'
        normal! gv"sy
        let l:word = substitute(@s, '\n', ' ', 'g')
    endif
    let l:url = substitute(s:engines[a:engine], '%s', u#urlencode(l:word), '')
    call u#open(l:url)
    call setpos('.', l:saved_cursor)
endfunction

" open url under cursor in browser
nnoremap <LocalLeader>bd :<C-U>call <SID>SearchWord('baidu','n')<CR>
vnoremap <LocalLeader>bd :<C-U>call <SID>SearchWord('baidu','v')<CR>
nnoremap <LocalLeader>bb :<C-U>call <SID>SearchWord('bing','n')<CR>
vnoremap <LocalLeader>bb :<C-U>call <SID>SearchWord('bing','v')<CR>
nnoremap <LocalLeader>bh :<C-U>call <SID>SearchWord('github','n')<CR>
vnoremap <LocalLeader>bh :<C-U>call <SID>SearchWord('github','v')<CR>
nnoremap <LocalLeader>bg :<C-U>call <SID>SearchWord('google','n')<CR>
vnoremap <LocalLeader>bg :<C-U>call <SID>SearchWord('google','v')<CR>
nnoremap <LocalLeader>bm :<C-U>call <SID>SearchWord('maven','n')<CR>
vnoremap <LocalLeader>bm :<C-U>call <SID>SearchWord('maven','v')<CR>
nnoremap <LocalLeader>bs :<C-U>call <SID>SearchWord('stackoverflow','n')<CR>
vnoremap <LocalLeader>bs :<C-U>call <SID>SearchWord('stackoverflow','v')<CR>
nnoremap <LocalLeader>bw :<C-U>call <SID>SearchWord('wikipedia','n')<CR>
vnoremap <LocalLeader>bw :<C-U>call <SID>SearchWord('wikipedia','v')<CR>
nnoremap <LocalLeader>ba :<C-U>call <SID>SearchWord('dash','n')<CR>
vnoremap <LocalLeader>ba :<C-U>call <SID>SearchWord('dash','v')<CR>


