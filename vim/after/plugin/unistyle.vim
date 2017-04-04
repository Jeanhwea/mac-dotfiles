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


fun! s:UniStyle()
  call s:UniStyleRemoveTrail()
endf

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
endf

fun! s:UniStyleRemoveEmptyLines()
  call u#safeexec('g/^\s*$/d','/')
endf

fun! s:UniStyleRemoveTrail()
  call u#safeexec('%s/\s\+$//e','/')
endf

fun! s:UniStyleCompressEmptyLine()
  let width = 1 * input('compress line threshold width = ')
  if width > 2
    let pattern = '%s/^\n\{'.width.',}/\r\r/e'
    call u#safeexec(pattern, '/')
  endif
endf

fun! s:UniStyleTabSet()
  let width = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if width > 0
    let &l:softtabstop = width
    let &l:tabstop = width
    let &l:shiftwidth = width
  endif
endf


command! -nargs=* UniStyleCompressEmptyLine :call <SID>UniStyleCompressEmptyLine()
command! -nargs=* UniStyleRemoveEmptyLines :call <SID>UniStyleRemoveEmptyLines()
command! -nargs=* UniStyleRemoveTrail :call <SID>UniStyleRemoveTrail()
command! -nargs=* UniStyleReplaceTab :call <SID>UniStyleReplaceTab()
command! -nargs=* UniStyleTabSet :call <SID>UniStyleTabSet()


augroup unistyle
  autocmd!
  autocmd BufWritePre *.c,*.h,*.cc,*.cpp,*.java,*.viz,*.vim,*.bat,*.py,*.rb
        \ :call <SID>UniStyle()
augroup END


" vim:set ts=2 sts=2 sw=2:
