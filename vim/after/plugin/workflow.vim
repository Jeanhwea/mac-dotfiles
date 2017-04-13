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

if exists('loaded_workflow') || &cp || v:version < 700
  finish
endif
let loaded_workflow = 1


" grep words in current directory
" From http://learnvimscriptthehardway.stevelosh.com/chapters/33.html
" register @g : store last grep string
fun! s:GrepOperator(type)
  if a:type ==# 'v'
    normal! `<v`>"gy
  elseif a:type ==# 'char'
    normal! `[v`]"gy
  else
    return
  endif
  silent execute 'grep! -R ' . shellescape(@g) . ' .'
  copen
  redraw!
endfun
nnoremap <LocalLeader>f :setlocal opfunc=<SID>GrepOperator<CR>g@
vnoremap <LocalLeader>f :<C-u>call <SID>GrepOperator(visualmode())<CR>


" return all filenames in quickfix list
fun! s:QuickfixFileNames()
  let files = {}
  for qf in getqflist()
    let files[bufname(qf['bufnr'])] = 1
  endfor
  return join(keys(files))
endfun
" :Ggrep findme
" :ArgsQuickfix
" :argdo %s/findme/replacement/gc
" :argdo update
command! -nargs=0 -bar ArgsQuickfix execute 'args ' . <SID>QuickfixFileNames()


fun! s:ChangeWord(mode)
  if a:mode ==# 'n'
    let src = expand('<cword>')
  elseif a:mode ==# 'v'
    let src = u#lastselect()
  endif
  let src = substitute(escape(src, '/\'), '\n', '\\n', 'g')
  let des = input('[' . src . '] -> ')
  if src !=# '' && des !=# ''
    execute ':'.line('.').',$substitute/\V'.src.'/'.des.'/gc'
    let @c = src
  endif
endfun
nnoremap <silent> <LocalLeader>cw :call <SID>ChangeWord('n')<CR>
vnoremap <silent> <LocalLeader>cw :<C-u>call <SID>ChangeWord('v')<CR>

fun! s:GenerateTags()
  if !executable('ctags')
    call h#warn("E570: Exuberant ctags not found in PATH")
  endif
  silent !ctags .
  redraw!
endfun
command! -bar -nargs=0 GenerateTags call <SID>GenerateTags()
nnoremap <silent> <LocalLeader>gt :GenerateTags<CR>

" vim:set ts=2 sts=2 sw=2:
