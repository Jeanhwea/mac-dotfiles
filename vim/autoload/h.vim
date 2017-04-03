"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2017-04-03                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('loaded_h') || &cp || v:version < 700
    finish
endif
let loaded_h = 1

" \ on Windows unless shellslash is set, / everywhere else.
fun! h#slash() abort
  return !exists('+shellslash') || &shellslash ? '/' : '\'
endfun


" get current datetime as string
" like: '2017-04-03 13:46:48'
fun! h#now()
  return strftime('%Y-%m-%d %H:%M:%S')
endf


" split a path into a list.
" '/tmp,,/home/user/tmp' -> ['/tmp', '', '/home/user/tmp']
fun! h#pathsplit(path) abort
  if type(a:path) == type([]) | return a:path | endif
  if empty(a:path) | return [] | endif
  let split = split(a:path,'\\\@<!\%(\\\\\)*\zs,')
  return map(split,'substitute(v:val,''\\\([\\,]\)'',''\1'',"g")')
endfun

" convert a list to a path.
" ['/tmp', '', '/home/user/tmp'] -> '/tmp,,/home/user/tmp'
fun! h#pathjoin(...) abort
  if type(a:1) == type(1) && a:1
    let i = 1
    let space = ' '
  else
    let i = 0
    let space = ''
  endif
  let path = ""
  while i < a:0
    if type(a:000[i]) == type([])
      let list = a:000[i]
      let j = 0
      while j < len(list)
        let escaped = substitute(list[j],'[,'.space.']\|\\[\,'.space.']\@=','\\&','g')
        let path .= ',' . escaped
        let j += 1
      endwhile
    else
      let path .= "," . a:000[i]
    endif
    let i += 1
  endwhile
  return substitute(path,'^,','','')
endfun

" remove duplicates from a list.
fun! h#pathuniq(list) abort
  let i = 0
  let seen = {}
  while i < len(a:list)
    if (a:list[i] ==# '' && exists('empty')) || has_key(seen,a:list[i])
      call remove(a:list,i)
    elseif a:list[i] ==# ''
      let i += 1
      let empty = 1
    else
      let seen[a:list[i]] = 1
      let i += 1
    endif
  endwhile
  return a:list
endfun

" return a list of glob patttern
fun! h#pathglob(pattern) abort
  let files = split(glob(a:pattern),"\n")
  return map(files,'substitute(v:val,"[".h#slash()."/]$","","")')
endfun


" print debug message to the message list
"
" Usage like:
"
"   call h#debug('hello world')
"
" diplay message, type following command
"   :messages
"
fun! h#debug(msg) abort
  echohl WarningMsg
  echomsg '[' . h#now() . '] ' . string(a:msg)
  echohl NONE
endfun

" vim:set ts=2 sts=2 sw=2:
