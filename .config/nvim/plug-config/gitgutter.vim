nmap <Leader>gt :GitGutterLineHighlightsToggle<CR>
nmap <Leader>gz :GitGutterFold<CR>
" set foldtext=gitgutter#fold#foldtext()

" set signcolumn=yes

command! Gqf GitGutterQuickFix | copen
nmap <Leader>gqf :Gqf<CR>

let g:gitgutter_preview_win_floating = 0
let g:gitgutter_use_location_list = 0

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('hello +%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

nmap <Leader>gst  :call GitStatus()<CR>
