fun! s:syntaxname(line,col,logging)
  let name = synIDattr(synID(a:line,a:col,1),'name')
  if a:logging
    call h#log('('.a:line.','.a:col.') '.name)
  endif
  return name
endfun
command! -nargs=0 SynName call <SID>syntaxname(line('.'),col('.'),1)

" experimental key mapping for debugging
nnoremap R ^vg_"ty:<C-R>t
nnoremap S :SynName<CR>
command! -nargs=* -complete=var L :call h#logvar(<q-args>,<args>)

