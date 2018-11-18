if exists('g:loaded_desktop') || &cp || v:version < 700
  finish
endif
let g:loaded_desktop = 1

" the modeline settings
set textwidth=80
set modeline
set colorcolumn=+1
set nocursorline nocursorcolumn

set backup
set undofile
set undolevels=1000
if has('unix')
  let &backupdir="$HOME/.vim/tmp/backup,/tmp,."
  let &undodir="$HOME/.vim/tmp/undo,/tmp,."
  let &directory="$HOME/.vim/tmp/swap,/tmp,."
endif

set dictionary+=$VIMFILES/dict/words.dict

set nospell
set spelllang=en_us
let &spellfile = expand($VIMFILES.'/spell/personal.utf-8.add,') .
               \ expand($VIMFILES.'/spell/nonwords.utf-8.add')

if has('gui')&&has('gui_running')
  set background=light
  colorscheme solarized
endif

set guioptions=gm
if exists('&guifont')
  if has('mac')
    set guifont=Monaco:h12
  elseif has('unix')
    set guifont=Monospace\ Medium\ 10
  elseif has('win32')||has('win64')
    " set guifont=Courier\ New:h10
    set guifont=Consolas:h11
  endif
  command! -bar -nargs=0 Bigger
        \ :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller
        \ :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif

" vim:set ft=vim et sw=2:
