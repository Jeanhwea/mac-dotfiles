"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2016-06-15                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('b:loaded_python_ftplugin') || &cp || v:version < 700
  finish
endif
let b:loaded_python_ftplugin = 1

" if executable('pydoc')
"   setlocal keywordprg=pydoc
" endif

if !exists("g:python_command")
  let g:python_command = 'python'
endif

" use command-r to run a python file
fun! s:PythonCompileAndRunFile()
  silent !clear
  execute '!' . g:python_command . ' ' . bufname('%')
endfun
nnoremap <buffer> <D-r> :call <SID>PythonCompileAndRunFile()<CR>

set path+=,operation/templates,templates,static
setlocal foldmethod=indent
setlocal foldignore=
setlocal foldlevel=99

" formatting python code with yapf. https://github.com/google/yapf
fun! YapfFormatExpr(start,end,char)
  if a:start > a:end | return | endif
  let l:cmd = 'yapf --lines='.a:start.'-'.a:end
  " call h#logvar('l:cmd', l:cmd)
  let l:formatted_text = system(l:cmd,join(getline(1, '$'), "\n")."\n")
  silent execute '1,'.string(line('$')).'delete'
  call setline(1, split(l:formatted_text, "\n"))
  call cursor(a:start, 1)
endfun

if executable('yapf')
  " let &l:formatprg='yapf'
  setlocal formatexpr=YapfFormatExpr(v:lnum,v:lnum+v:count-1,v:char)
endif
