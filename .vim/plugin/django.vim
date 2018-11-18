if exists('did_django_vim') || &cp || version < 700
  finish
endif
let did_django_vim = 1


" make file jumps between relative django files easier
" https://code.djangoproject.com/wiki/UsingVimWithDjango#Mappings
let g:last_relative_dir = ''
nnoremap \m :call RelatedFile("models.py")<cr>
nnoremap \v :call RelatedFile("views.py")<cr>
nnoremap \a :call RelatedFile("admin.py")<cr>
nnoremap \b :call RelatedFile("tests.py")<cr>
nnoremap \u :call RelatedFile("urls.py")<cr>
nnoremap \t :call RelatedFile("templates/")<cr>
nnoremap \f :call RelatedFile("static/")<cr>
nnoremap \s :e `find -iname settings.py`<cr>

fun! RelatedFile(file)
  " This is to check that the directory looks djangoish
  if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
    exec "edit %:h/" . a:file
    let g:last_relative_dir = expand("%:h") . '/'
    return ''
  endif
  if g:last_relative_dir != ''
    exec "edit " . g:last_relative_dir . a:file
    return ''
  endif
  echo "Cant determine where relative file is : " . a:file
  return ''
endfun

fun SetAppDir()
  if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
    let g:last_relative_dir = expand("%:h") . '/'
    return ''
  endif
endfun
autocmd BufEnter *.py call SetAppDir()
