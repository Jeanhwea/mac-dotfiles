"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          _                         _                                  "
"        | |                        | |                                 "
"        | |   ___    __ _   _ __   | |__   __      __   ___    __ _    "
"    _   | |  / _ \  / _` | | '_ \  | '_ \  \ \ /\ / /  / _ \  / _` |   "
"   | |__| | |  __/ | (_| | | | | | | | | |  \ V  V /  |  __/ | (_| |   "
"    \____/   \___|  \__,_| |_| |_| |_| |_|   \_/\_/    \___|  \__,_|   "
"                                                                       "
"                                                                       "
" This gvimrc.vim file is a personal gvim configuration file.           "
" It's free for you to use and share                                    "
"                                                                       "
" author : Jinghui Hu                                                   "
" email  : hujinghui@buaa.edu.cn                                        "
" github : https://github.com/Jeanhwea/                                 "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove toolbar, scrolling bar, menu
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r

" depends on vimrc.vim
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
        \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
    command! -bar -nargs=0 Smaller
        \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
endif

" "remember last vim path"
if has('win32')||has('win64')
    let s:lastpath_filename = $HOME . '\.last_vim_path'
elseif has('unix')
    let s:lastpath_filename = $HOME . '/.local/last_vim_path'
endif
fun s:SaveLastPath()
    if !filewritable(s:lastpath_filename)
        return
    endif
    let last_path = [getcwd()]
    call writefile(last_path, s:lastpath_filename)
endf
fun s:LoadLastPath()
    if !filereadable(s:lastpath_filename)
        return
    endif
    let last_path = readfile(s:lastpath_filename)
    if len(last_path) >= 1
        exec 'cd ' . last_path[0]
    endif
endf
if has('autocmd')
    augroup LoadLast
        au!
        au VimEnter * call <SID>LoadLastPath()
        au VimLeave * call <SID>SaveLastPath()
    augroup END
endif

" set messages to english
if has('win32')||has('win64')
    language messages en_US.utf-8
endif

" vim:set foldmethod=marker:
