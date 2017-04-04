"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2017-04-04                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('loaded_u') || &cp || v:version < 700
  finish
endif
let loaded_u = 1

let s:urlmap = {
\   ' ' : '\\%20', '!' : '\\%21', '"' : '\\%22', '#' : '\\%23', '$' : '\\%24',
\   '%' : '\\%25', '&' : '\\%26', "'" : '\\%27', '(' : '\\%28', ')' : '\\%29',
\   '*' : '\\%2A', '+' : '\\%2B', ',' : '\\%2C', '-' : '\\%2D', '.' : '\\%2E',
\   '/' : '\\%2F', ':' : '\\%3A', ';' : '\\%3B', '<' : '\\%3C', '=' : '\\%3D',
\   '>' : '\\%3E', '?' : '\\%3F', '@' : '\\%40', '[' : '\\%5B', '\' : '\\%5C',
\   ']' : '\\%5D', '^' : '\\%5E', '_' : '\\%5F', '`' : '\\%60', '{' : '\\%7B',
\   '|' : '\\%7C', '}' : '\\%7D', '~' : '\\%7E',
\}

fun! u#urlencode(str)
  let url = ''
  for ch in split(a:str, '\zs')
    if has_key(s:urlmap, ch)
      let url .= s:urlmap[ch]
    else
      let url .= ch
    endif
  endfor
  return url
endf

fun! u#open(url)
  if has('mac')
    silent! exe '!open "' . a:url . '" >/dev/null 2>&1'
  elseif has('unix')
    silent! exe '!xdg-open "' . a:url . '" >/dev/null 2>&1 &'
  elseif has('win32')||has('win64')
    silent! exe '!start cmd /cstart /b '.a:url
  endif
  redraw!
endf

" usage:
"  call u#safeexec('%s/hello/world/e','/')
fun! u#safeexec(command,registers)
  let pos = getpos(".")
  let saved_reg = {}
  if type(a:registers) == type('') && len(a:registers)>0
    for r in split(a:registers, '\zs')
      let saved_reg[r] = getreg(r)
    endfor
  endif
  exec a:command
  for [k,v] in items(saved_reg)
    call setreg(k,v)
  endfor
  call setpos('.', pos)
endf

" vim:set ts=2 sts=2 sw=2:
