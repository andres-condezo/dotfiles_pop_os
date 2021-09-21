
"--------------------------------------------------------------------------------------------------
"----------------------------------  EXCECUTION  -----------------------------------------------------

augroup exe_code
  autocmd!

  "execute python code
  autocmd FileType python nnoremap <buffer> <leader>p
  \ :sp<CR> :term python3 %<CR> :startinsert<CR>

  "execute javaScript code
  autocmd FileType javascript nnoremap <buffer> <leader>p
  \ :sp<CR> :term node %<CR> :startinsert<CR>

  "execute bash code
  autocmd FileType bash,sh nnoremap <buffer> <leader>p
  \ :sp<CR> :term bash %<CR> :startinsert<CR>

  "execute bash code
  autocmd FileType c nnoremap <buffer> <leader>p
  \ :sp<CR> :term ~/c %<CR> :startinsert<CR>

augroup END
