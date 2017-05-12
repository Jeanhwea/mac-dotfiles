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

" "Fast navigation"
nnoremap <Space> <C-d>

" "Fast Opening", editing file in current line
nnoremap <LocalLeader>ew :e <C-r>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>es :sp <C-r>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>ev :vsp <C-r>=expand('%:p:h') . '/' <CR>
nnoremap <LocalLeader>et :tabe <C-r>=expand('%:p:h') . '/' <CR>

" "UpperCase word", using in insert mode
inoremap <C-d> <Esc>mzgUiw`za

" "Fast Quit"
noremap <LocalLeader>q :qa<CR>

" "Last pasted region"
nnoremap <LocalLeader>lp `[v`]

" "Open digraph", for details, see, h i_Ctrl-K
nnoremap <LocalLeader>di :digraphs<CR>

" "Split line", normally S is equal to cc, so map S to split line
nnoremap S mzi<CR><Esc>`z

fun! s:GetColorSchemes()
  let rtps = split(&runtimepath, ',')
  let colorschemes = []
  for rtp in rtps
    let colors_dir = rtp.'/colors'
    if (isdirectory(colors_dir))
      for colorname in split(glob(colors_dir.'/*.vim'),'\n')
        call add(colorschemes, fnamemodify(colorname, ':t:r'))
      endfor
    endif
  endfor
  return uniq(sort(colorschemes))
endfun

fun! s:ShiftColorScheme(direction)
  let colorschemes = s:GetColorSchemes()
  let total_colors = len(colorschemes)
  if total_colors > 0
    let icolor = 0
    while icolor < total_colors
      if g:colors_name ==? colorschemes[icolor]
        if a:direction ==# 'n'
          let shift_colors = colorschemes[(icolor+1)%total_colors]
        elseif a:direction ==# 'p'
          let shift_colors = colorschemes[(icolor-1)%total_colors]
        endif
        break
      endif
      let icolor += 1
    endwhile
    execute 'colorscheme '.shift_colors
  endif
endfun


" "Arrow Key", binding arrows to change colorscheme
noremap <Up> <Esc>:colorscheme solarized<CR>
noremap <Down> <Esc>:colorscheme molokai<CR>
noremap <Left> :call <SID>ShiftColorScheme('p')<CR>
noremap <Right> :call <SID>ShiftColorScheme('n')<CR>

" "unimpaired style toggle", for Tagbar
nnoremap cot :TagbarToggle<CR>
nnoremap [ot :TagbarOpen<CR>
nnoremap ]ot :TagbarClose<CR>

" vim:set ts=2 sts=2 sw=2:
