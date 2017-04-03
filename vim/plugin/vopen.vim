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
if exists('loaded_vopen') || &cp || v:version < 700
    finish
endif
let loaded_vopen = 1


fun! s:runtime_findfile(file,count) abort
  let rtp = h#pathjoin(1,h#pathsplit(&rtp))
  let file = findfile(a:file,rtp,a:count)
  if file ==# ''
    return ''
  else
    return fnamemodify(file,':p')
  endif
endfun

fun! s:fnameescape(string) abort
  if exists('*fnameescape')
    return fnameescape(a:string)
  elseif a:string ==# '-'
    return '\-'
  else
    return substitute(escape(a:string," \t\n*?[{`$\\%#'\"|!<"),'^[+>]','\\&','')
  endif
endfun

fun! s:find(count,cmd,file,lcd)
  let rtp = h#pathjoin(1,h#pathsplit(&runtimepath))
  let file = s:runtime_findfile(a:file,a:count)
  if file ==# ''
    return "echoerr 'E345: Can''t find file \"".a:file."\" in runtimepath'"
  endif
  if a:lcd
    let path = file[0:-strlen(a:file)-2]
    execute 'lcd `=path`'
    return a:cmd.' '.s:fnameescape(a:file)
  else
    return a:cmd.' '.s:fnameescape(file)
  endif
endfun

fun! s:Findcomplete(ArgLead,CmdLine,CursorPos)
  let sep = h#slash()
  let cheats = {
        \'a': 'autoload',
        \'d': 'doc',
        \'f': 'ftplugin',
        \'i': 'indent',
        \'m': 'macro',
        \'p': 'plugin',
        \'s': 'syntax'}
  if a:ArgLead =~# '^\w[\\/]' && has_key(cheats,a:ArgLead[0])
    let request = cheats[a:ArgLead[0]].a:ArgLead[1:-1]
  else
    let request = a:ArgLead
  endif
  let pattern = substitute(request,'/\|\'.sep,'*'.sep,'g').'*'
  let found = {}
  for path in h#pathsplit(&runtimepath)
    let path = expand(path, ':p')
    let matches = split(glob(path.sep.pattern),"\n")
    call map(matches,'isdirectory(v:val) ? v:val.sep : v:val')
    call map(matches,'expand(v:val, ":p")[strlen(path)+1:-1]')
    for match in matches
      let found[match] = 1
    endfor
  endfor
  return sort(keys(found))
endfun

command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Ve       :execute s:find(<count>,'edit<bang>',<q-args>,0)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vedit    :execute s:find(<count>,'edit<bang>',<q-args>,0)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vopen    :execute s:find(<count>,'edit<bang>',<q-args>,1)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vsplit   :execute s:find(<count>,'split',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vvsplit  :execute s:find(<count>,'vsplit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vtabedit :execute s:find(<count>,'tabedit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vpedit   :execute s:find(<count>,'pedit',<q-args>,<bang>1)
command! -bar -bang -range=1 -nargs=1 -complete=customlist,s:Findcomplete Vread    :execute s:find(<count>,'read',<q-args>,<bang>1)


" vim:set ts=2 sts=2 sw=2:
