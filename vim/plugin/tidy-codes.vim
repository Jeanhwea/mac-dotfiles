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

" maintain the state and execute the command
function! s:Execute(command)
    " Preparation, save last search, and cursor position.
    let l:saved_register=@/
    let l:saved_cursor = getpos(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/= l:saved_register
    call setpos('.', l:saved_cursor)
endfunction

nnoremap _$ :call <SID>Execute('%s/\s\+$//e')<CR>
nnoremap _= :call <SID>Execute('g/^\s*$/d')<CR>

if has('autocmd')
    augroup tidy_codes
        autocmd!
        autocmd BufWritePre *.c,*.h,*.cc,*.cpp,*.java,*.viz,*.vim,*.bat,*.py
              \ :call <SID>Execute('%s/\s\+$//e')
    augroup END
end

" set tabstop, softtabstop and shiftwidth to the same value
function! s:Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
endfunction
command! -nargs=* Stab call <SID>Stab()

" swap between tab and space
function! s:SwapTabAndSpace()
    if &expandtab
        set noexpandtab
        :%retab!
    else
        set expandtab
        :%retab!
    endif
endfunction
command! -nargs=* SwapTabAndSpace call <SID>SwapTabAndSpace()<CR>


