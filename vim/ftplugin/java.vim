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

if exists('b:loaded_java_ftplugin') || &cp || v:version < 700
  finish
endif
let b:loaded_java_ftplugin = 1

" using vim help system for javadoc
setlocal keywordprg=:help

" using ~/.vim/compiler/mvn.vim
compiler! mvn

" set java source path
setlocal path=.
" jdk source path
if $JAVA_HOME != ""
  setlocal path+=$JAVA_HOME/src
endif
" maven source path
setlocal path+=src/main/java
setlocal path+=src/test/java

" cscope jdk source
if $CSCOPE_DB_JDK != "" && filereadable($CSCOPE_DB_JDK)
  silent! cs add $CSCOPE_DB_JDK
endif

fun! s:JavaRun()
  silent !clear
  execute "!./run.sh"
endfun

nnoremap <buffer> <LocalLeader>mc :make compile<CR>
nnoremap <buffer> <LocalLeader>mi :make install<CR>
nnoremap <buffer> <LocalLeader>mp :make package<CR>
nnoremap <buffer> <LocalLeader>mt :make test<CR>
nnoremap <buffer> <D-r> :call <SID>JavaRun()<CR>
