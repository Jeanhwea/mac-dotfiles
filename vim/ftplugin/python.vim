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

function! s:PythonCompileAndRunFile()
  silent !clear
  execute '!' . g:python_command . ' ' . bufname('%')
endfunction

set path+=,operation/templates,templates,static
setlocal foldmethod=indent
setlocal foldlevel=99

nnoremap <buffer> Q :call <SID>PythonCompileAndRunFile()<CR>

