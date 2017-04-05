"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         _                          _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This file create on 2016-06-14                                        "
" It's free for you to use and share.                                   "
"                                                                       "
" Author : Jinghui Hu                                                   "
" Email  : hujinghui@buaa.edu.cn                                        "
" Github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('loaded_shortcuts') || &cp || v:version < 700
  finish
endif
let loaded_shortcuts = 1


" "Fast Opening", editing file in current line
nnoremap <LocalLeader>ew :e <C-R>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>es :sp <C-R>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>ev :vsp <C-R>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>et :tabe <C-R>=expand('%:p:h') . '/' <CR>

" "UpperCase word", using in insert mode
inoremap <C-D> <ESC>mzgUiw`za

" "Fast Quit"
noremap <LocalLeader>q :qa<CR>

" "Last pasted region"
nnoremap <LocalLeader>lp `[v`]

" "Open digraph", for details, see, h i_Ctrl-K
nnoremap <LocalLeader>di :digraphs<CR>

" "Split line", normally S is equal to cc, so map S to split line
nnoremap S mzi<CR><ESC>`z

" vim:set ts=2 sts=2 sw=2:
