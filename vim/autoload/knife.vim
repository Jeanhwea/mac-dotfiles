"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2016-06-27                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("g:loaded_knife") || &cp
  finish
endif
let g:loaded_knife = 1


fun knife#open(url)
    if has('mac')
        silent! exe '!open "' . a:url . '" >/dev/null 2>&1'
    elseif has('unix')
        silent! exe '!xdg-open "' . a:url . '" >/dev/null 2>&1 &'
    elseif has('win32')||has('win64')
        silent! exe '!start cmd /cstart /b '.a:url
    endif
    redraw!
endf

let s:url_encode_map = {
\   ' ' : '\\%20', '!' : '\\%21', '"' : '\\%22', '#' : '\\%23', '$' : '\\%24',
\   '%' : '\\%25', '&' : '\\%26', "'" : '\\%27', '(' : '\\%28', ')' : '\\%29',
\   '*' : '\\%2A', '+' : '\\%2B', ',' : '\\%2C', '-' : '\\%2D', '.' : '\\%2E',
\   '/' : '\\%2F', ':' : '\\%3A', ';' : '\\%3B', '<' : '\\%3C', '=' : '\\%3D',
\   '>' : '\\%3E', '?' : '\\%3F', '@' : '\\%40', '[' : '\\%5B', '\' : '\\%5C',
\   ']' : '\\%5D', '^' : '\\%5E', '_' : '\\%5F', '`' : '\\%60', '{' : '\\%7B',
\   '|' : '\\%7C', '}' : '\\%7D', '~' : '\\%7E',
\}

fun knife#encode_url(str)
    let encoded_str = ''
    for i in range(strlen(a:str))
        if has_key(s:url_encode_map, a:str[i])
            let encoded_str .= s:url_encode_map[a:str[i]]
        else
            let encoded_str .= a:str[i]
        endif
    endfor
    return encoded_str
endf
