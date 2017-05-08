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

if exists('loaded_unistyle') || &cp || v:version < 700
  finish
endif
let loaded_unistyle = 1


augroup unistyle
  autocmd!
  " set tabstop softtabstop shiftwidth expandtab/noexpandtab
  autocmd FileType vim,javascript setlocal ts=2 sts=2 sw=2 et
  autocmd FileType text,markdown setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noet
  " set cindent autoindent
  autocmd FileType c,cpp,java setlocal cin ai
  autocmd FileType python,vim,javascript,html,xml,css setlocal nocin ai
  autocmd FileType text,markdown setlocal nocin noai
  " set list
  autocmd FileType text,markdown setlocal nolist
  " set commentstring
  autocmd FileType sql,mysql setlocal cms=--\ %s
  autocmd FileType viz setlocal cms=\'\ %s
  autocmd FileType gdb,python setlocal cms=#\ %s
  " set wrap
  autocmd FileType text setlocal wrap
  " set cursorline cursorcolumn colorcolumn {{{2
  autocmd FileType help,fugitiveblame setlocal nocul nocuc cc&
  " tidy codes
  autocmd BufWritePre *.bat,*.c,*.cc,*.cpp,*.h,*.java,*.py,*.rb,*.vim,*.viz :call <SID>UniStyle()
augroup END

fun! s:UniStyle()
  call s:UniStyleRemoveTrail()
endfun

fun! s:UniStyleReplaceTab()
  let width = 1 * input('replace tab to width = ')
  if &expandtab && width > 0
    let saved_tabstop = &l:tabstop
    let &l:softtabstop = width
    let &l:tabstop = width
    let &l:shiftwidth = width
    :%retab!
    let &l:softtabstop = saved_tabstop
    let &l:tabstop = saved_tabstop
    let &l:shiftwidth = saved_tabstop
  endif
endfun

fun! s:UniStyleRemoveEmptyLines()
  call u#safeexec('g/^\s*$/d','/')
endfun

fun! s:UniStyleRemoveTrail()
  call u#safeexec('%s/\s\+$//e','/')
endfun

fun! s:UniStyleCompressEmptyLine()
  let width = 1 * input('compress line threshold width = ')
  if width > 2
    let pattern = '%s/^\n\{'.width.',}/\r\r/e'
    call u#safeexec(pattern, '/')
  endif
endfun

fun! s:UniStyleTabSet()
  let width = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if width > 0
    let &l:softtabstop = width
    let &l:tabstop = width
    let &l:shiftwidth = width
  endif
endfun


command! -nargs=* UniStyleCompressEmptyLine :call <SID>UniStyleCompressEmptyLine()
command! -nargs=* UniStyleRemoveEmptyLines :call <SID>UniStyleRemoveEmptyLines()
command! -nargs=* UniStyleRemoveTrail :call <SID>UniStyleRemoveTrail()
command! -nargs=* UniStyleReplaceTab :call <SID>UniStyleReplaceTab()
command! -nargs=* UniStyleTabSet :call <SID>UniStyleTabSet()


" vim:set ts=2 sts=2 sw=2:
