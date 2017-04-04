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

if exists('loaded_lastpath') || &cp || v:version < 700
  finish
endif
let loaded_lastpath = 1

let g:lastpath_file = $HOME.'/.lastpath'
fun s:SaveLastPath()
  if !filewritable(g:lastpath_file)
    return
  endif
  let lastpath = [getcwd()]
  call writefile(lastpath, g:lastpath_file)
endf
fun s:LoadLastPath()
  if !filereadable(g:lastpath_file)
    return
  endif
  let lastpath = readfile(g:lastpath_file)
  if len(lastpath) >= 1
    exec 'cd ' . lastpath[0]
  endif
endf

augroup lastpath
  au!
  au VimEnter * call <SID>LoadLastPath()
  au VimLeave * call <SID>SaveLastPath()
augroup END


" vim:set ts=2 sts=2 sw=2:
