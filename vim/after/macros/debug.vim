" Show syntax highlighting groups for word under cursor
fun! s:SyntaxStack(line,col,logging)
  if !exists("*synstack")
    return
  endif
  if a:logging
    call h#log(map(synstack(a:line,a:col),'synIDattr(v:val,"name")'))
  endif
endfun
command! -nargs=0 SynStack call <SID>SyntaxStack(line('.'),col('.'),1)

" Show syntax highlighting groups for word under cursor
fun! s:SyntaxName(line,col,logging)
  let name = synIDattr(synID(a:line,a:col,1),'name')
  if a:logging
    call h#log('('.a:line.','.a:col.') '.name)
  endif
  return name
endfun
command! -nargs=0 SynName call <SID>SyntaxName(line('.'),col('.'),1)

" experimental key mapping for debugging
nnoremap R ^vg_"ty:<C-r>t
nnoremap s :SynStack<CR>
nnoremap S :SynName<CR>
command! -nargs=* -complete=var L :call h#logvar(<q-args>,<args>)

