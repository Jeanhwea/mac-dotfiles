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

if exists('loaded_askme') || &cp || v:version < 700
  finish
endif
let loaded_askme = 1

let s:engines = {
\ 'baidu'         : 'http://www.baidu.com/s?wd=%s',
\ 'bing'          : 'http://global.bing.com/search?q=%s',
\ 'github'        : 'http://github.com/search?q=%s',
\ 'google'        : 'http://www.google.com/search?q=%s',
\ 'maven'         : 'http://mvnrepository.com/search?q=%s',
\ 'stackoverflow' : 'http://stackoverflow.com/search?q=%s',
\ 'wikipedia'     : 'http://en.wikipedia.org/wiki/Special:Search?search=%s',
\ 'dash'          : 'dash://%s',
\}

function! s:SearchWord(engine, mode)
  let saved_cursor = getpos('.')
  if a:mode ==# 'n'
    let keyword = expand('<cword>')
    let @s = keyword
  elseif a:mode ==# 'v'
    normal! gv"sy
    let keyword = substitute(@s, '\n', ' ', 'g')
  endif
  let l:url = substitute(s:engines[a:engine], '%s', u#urlencode(keyword), '')
  call u#open(l:url)
  call setpos('.', saved_cursor)
endfunction

" open url under cursor in browser
nnoremap <LocalLeader>bd :<C-u>call <SID>SearchWord('baidu','n')<CR>
vnoremap <LocalLeader>bd :<C-u>call <SID>SearchWord('baidu','v')<CR>
nnoremap <LocalLeader>bb :<C-u>call <SID>SearchWord('bing','n')<CR>
vnoremap <LocalLeader>bb :<C-u>call <SID>SearchWord('bing','v')<CR>
nnoremap <LocalLeader>bh :<C-u>call <SID>SearchWord('github','n')<CR>
vnoremap <LocalLeader>bh :<C-u>call <SID>SearchWord('github','v')<CR>
nnoremap <LocalLeader>bg :<C-u>call <SID>SearchWord('google','n')<CR>
vnoremap <LocalLeader>bg :<C-u>call <SID>SearchWord('google','v')<CR>
nnoremap <LocalLeader>bm :<C-u>call <SID>SearchWord('maven','n')<CR>
vnoremap <LocalLeader>bm :<C-u>call <SID>SearchWord('maven','v')<CR>
nnoremap <LocalLeader>bs :<C-u>call <SID>SearchWord('stackoverflow','n')<CR>
vnoremap <LocalLeader>bs :<C-u>call <SID>SearchWord('stackoverflow','v')<CR>
nnoremap <LocalLeader>bw :<C-u>call <SID>SearchWord('wikipedia','n')<CR>
vnoremap <LocalLeader>bw :<C-u>call <SID>SearchWord('wikipedia','v')<CR>
nnoremap <LocalLeader>ba :<C-u>call <SID>SearchWord('dash','n')<CR>
vnoremap <LocalLeader>ba :<C-u>call <SID>SearchWord('dash','v')<CR>

" vim:set ts=2 sts=2 sw=2:
