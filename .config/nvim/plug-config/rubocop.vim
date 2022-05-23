" Set specific linters
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

" Disable ALE auto highlights
" let g:ale_set_highlights = 0

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
let g:ale_fix_on_save = 1

let g:ale_history_log_output = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

" \   'javascript': ['prettier', 'eslint'],
" \   'typescript': ['eslint'],
" \   'css': ['prettier']

" let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '-D'
