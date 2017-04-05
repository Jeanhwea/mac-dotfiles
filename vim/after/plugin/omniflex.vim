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

if exists('loaded_omniflex') || &cp || v:version < 700
  finish
endif
let loaded_omniflex = 1

fun! s:find(count,cmd,file,lcd)
  let filename = len(a:file) > 0 ? split(a:file)[-1] : ''
  let file = findfile(filename,a:count)
  if file ==# ''
    return "echoerr 'E345: Can''t find file \"".a:file."\" in runtimepath'"
  endif
  return a:cmd.' '.h#fnameescape(file)
endfun

fun! s:Findcomplete(ArgLead,CmdLine,CursorPos)
  let sep = h#slash()
  let cmd = split(a:CmdLine)
  if len(cmd) > 2
    let suffix = '*.'.cmd[1]
  else
    let suffix = '*'
  endif
  if a:ArgLead =~# '^\w[\\/]'
    let pattern = substitute(a:ArgLead,'/\|\'.sep,'*'.sep.'*','g').suffix
  else
    let pattern = '**'.sep.'*'.a:ArgLead.suffix
  endif
  call h#log(pattern)
  let matches = split(glob(pattern),"\n")
  return matches
endfun

command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Oe :execute s:find(<count>,'edit<bang>',<q-args>,0)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Oedit :execute s:find(<count>,'edit<bang>',<q-args>,0)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Oopen :execute s:find(<count>,'edit<bang>',<q-args>,1)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Osplit :execute s:find(<count>,'split',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Ovsplit :execute s:find(<count>,'vsplit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Otabedit :execute s:find(<count>,'tabedit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Opedit :execute s:find(<count>,'pedit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=* -complete=customlist,s:Findcomplete
      \ Oread :execute s:find(<count>,'read',<q-args>,<bang>1)


" vim:set ts=2 sts=2 sw=2:
