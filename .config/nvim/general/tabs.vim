"--------------------------------------------------------------------------------------------------
"-------------------------------- TABS ------------------------------------------------------------

" Indentación a 2 espacios
set tabstop=8
set shiftwidth=8
"set shiftwidth=2                        " Change the number of space characters inserted for indentation
set softtabstop=8
set shiftround
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4

set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

set noexpandtab
"set expandtab                           " Converts tabs to spaces
"
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
autocmd FileType c setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab


"--------------------------------------------------------------------------------------------------
"-------------------------------- COLUMN lIMITS ------------------------------------------------------------

autocmd FileType c setlocal  colorcolumn=80
autocmd FileType vim setlocal  colorcolumn=0 expandtab
"let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
"set colorcolumn=+1
"set colorcolumn=-1,+30
"hi ColorColumn ctermbg=Cyan guibg=Cyan
highlight ColorColumn guibg=#25223d
highlight ErrorMsg guibg=#25223d


" " toggle between number and relative number on ,l
" nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
" function! ToggleRelativeAbsoluteNumber()
"   if &number
"     set relativenumber
"   else
"     set number
"   endif
" endfunction

" hi clear CursorLine
" augroup CLClear
"     autocmd! ColorScheme * hi clear CursorLine
" augroup END

" hi CursorLineNR cterm=bold
" augroup CLNRSet
"     autocmd! ColorScheme * hi CursorLineNR cterm=bold
" augroup END
