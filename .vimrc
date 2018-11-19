if &cp || v:version < 700
  finish
endif

" .vim directory, where stores all personal vim scripts
let $VIMFILES = expand('~/.vim')

if &compatible | set nocompatible | endif

" setup leader key, this must be set at startup.
let mapleader="\\"
let g:mapleader="\\"
let maplocalleader=","
let g:maplocalleader=","

if !isdirectory(expand('$VIMFILES/bundle/pathogen'))
  echoe "Install pathogen first and all packages first!"
  finish
endif
set runtimepath+=$VIMFILES/bundle/pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

if has('autocmd')
  filetype plugin indent on

  augroup MsicOption
    autocmd!
    autocmd FileType help,qf nnoremap <silent><buffer> q :q<CR>
    " Return to last edit position
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     exe "normal! g`\"" |
          \ endif
  augroup END

  augroup FTDetect
    autocmd!
    autocmd Bufnew,BufRead *.md setlocal filetype=markdown
    autocmd Bufnew,BufRead *.sql setlocal filetype=mysql
    autocmd Bufnew,BufRead *.ts setlocal filetype=javascript
  augroup END

  augroup FTDictionary
    autocmd!
    autocmd FileType vim        setlocal dict+=$VIMFILES/dict/vim.dict
  augroup END

endif "has('autocmd')

" vim:set ft=vim et sw=2:
