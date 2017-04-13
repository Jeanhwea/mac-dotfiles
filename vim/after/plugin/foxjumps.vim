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

if exists('loaded_foxjumps') || &cp || v:version < 700
  finish
endif
let loaded_foxjumps = 1

" Add * to visual search
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
fun! s:VisualStarSearch(searchtype)
  let sreg = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:searchtype.'\'), '\n', '\\n', 'g')
  let @s = sreg
endfun
xnoremap * :<C-u>call <SID>VisualStarSearch('/')<CR>/<C-r>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VisualStarSearch('?')<CR>?<C-r>=@/<CR><CR>


" vim:set ts=2 sts=2 sw=2:
