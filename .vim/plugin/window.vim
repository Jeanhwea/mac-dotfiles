finish " disable this plugins
if exists('loaded_window') || &cp || v:version < 700
  finish
endif
let loaded_window = 1

function! WinMove(key)
  let t:curwin = winnr()
  exec 'wincmd '.a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec 'wincmd '.a:key
  endif
endfunction

" Window movement shortcuts
nnoremap <C-h> :call WinMove('h')<cr>
nnoremap <C-l> :call WinMove('l')<cr>
nnoremap <C-j> :call WinMove('j')<cr>
nnoremap <C-k> :call WinMove('k')<cr>
