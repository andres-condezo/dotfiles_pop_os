" "===== settings =====
" filetype plugin on
" filetype indent on
" syntax on
" set mouse=a
" set number
" set rnu
" set incsearch
" set hlsearch
" set autoread
" set wildmenu
" set laststatus=2
" set expandtab
" set smarttab
" set shiftwidth=4
" set tabstop=4
" set lbr
" set tw=500
" set ai
" set si
" set wrap
" set nobackup
" set nowb
" set noswapfile
" set encoding=utf8
" set ruler
" set cmdheight=1
" set hid
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l
" set ignorecase
" set smartcase
" set list
" set listchars=tab:>\ ,trail:-

"===== keymaps =====
" nnoremap J 5j
" xnoremap J 5j
" nnoremap K 5k
" xnoremap K 5k

" nnoremap L g_
" xnoremap L g_
" nnoremap H ^
" xnoremap H ^

" nnoremap > >>
" xnoremap > >gv
" nnoremap < <<
" xnoremap < <gv
"
"
"
" nnoremap <up> :res +5<CR>
" nnoremap <down> :res -5<CR>
" nnoremap <left> :vertical resize-5<CR>
" nnoremap <right> :vertical resize+5<CR>

"--------------------------------
"-------------------------------- OPTIONS 

filetype plugin indent on
syntax enable

set ignorecase
set smartcase
set path+=**
set termguicolors            " Active true colors en la terminal
set nocompatible
set numberwidth=1
set showcmd
set cmdheight=2
set showmatch
set laststatus=2
set title
set spelllang=en,es          " Corregir palabras usando diccionarios en inglés y español
set hidden                   " Required to keep multiple buffers open multiple buffers
set pumheight=10             " Makes pop up menu smaller
set fileencoding=utf-8       " The encoding written to file
set encoding=utf-8           " The encoding displayed
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set shiftwidth=2
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set hidden                              " Permitir cambiar de buffers sin tener que guardarlos
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeout Len is 1000 ms
set formatoptions-=cro
set autochdir                           " Your working directory will always be the same as your working directory
set hlsearch
set incsearch
set wildmenu
set wildmode=longest,list,full
set undofile
set undodir=/home/kali/.vimundo/ 
set clipboard=unnamedplus
set go+=a 
set whichwrap+=<,>,[,],h,l
set shortmess=c
set showtabline=2
set scrolloff=7
set sidescrolloff=7 

"--------------------------------
"-------------------------------- MAPLEADER
let mapleader=" "

"----------------------------------
"---------------------------------- PLUGINS
call plug#begin('~/.vim/plugged')
" Themes"
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/edge'
Plug 'gilgigilgil/anderson.vim'
Plug 'ntk148v/vim-horizon'
Plug 'tomasiser/vim-code-dark'

Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'

" IDE
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'KabbAmine/vCoolor.vim'
"" Plug 'liuchengxu/vim-which-key'
Plug 'turbio/bracey.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'terryma/vim-multiple-cursors'
" file manager
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Plug 'francoiscabrol/ranger.vim'
Plug 'vim-syntastic/syntastic'
" support sass colors
"Plug 'shmargum/vim-sass-colors'
Plug 'rhysd/vim-healthcheck'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
" Plug 'BourgeoisBear/clrzr'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
" Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'liuchengxu/vim-which-key'
Plug 'blindFS/vim-taskwarrior'
call plug#end()

"--------------------------------
"-------------------------------- COLOR SCHEME
colorscheme codedark 
let g:gruvbox_contrast_dark = "hard"
let g:airline_theme = 'onedark'

"-----------------------------------
"----------------------------------- AIRLINE
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ''
 let g:airline#extensions#tabline#left_alt_sep = ''
 let g:airline#extensions#tabline#right_sep = ''
 let g:airline#extensions#tabline#right_alt_sep = ''
 let g:airline#extensions#tabline#formatter = 'unique_tail'
 " enable powerline fonts
 let g:airline_powerline_fonts = 1
 let g:airline_left_sep = ''
 let g:airline_right_sep = ''

"----------------------------------
"---------------------------------- DEVICONS
" These are the basic settings to get the font to work (required):
 set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" loading the plugin
 let g:webdevicons_enable = 1
" adding the flags to NERDTree
 let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
 let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
 let g:webdevicons_enable_airline_statusline = 1
" enable folder/directory glyph flag (disabled by default with 0)
 let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"------------------------------
"------------------------------ INDENT GUIDES
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 3

"--------------------------------
"-------------------------------- STARTIFY
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'v': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ ]

"------------------------------------
"------------------------------------ FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'alt-v': 'vsplit'
  \}
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <Leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>F :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Exception'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"------------------------------
"------------------------------ NEOSNIPPETS

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

"----------------------------------
"---------------------------------- VIM-HIGHLIGHTEDYANK
let g:highlightedyank_highlight_duration = 300
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_in_visual = 0

"----------------------------------
"---------------------------------- MULTI CURSOR
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"----------------------------------
"---------------------------------- COLOR PICKER
let g:vcoolor_lowercase = 1
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<leader>g'
let g:vcoolor_custom_picker = 'zenity --title "custom" --color-selection --show-palette --color '

"----------------------------------
"---------------------------------- BRACEY
let g:bracey_auto_start_browser=0                                
let g:bracey_server_allow_remote_connections=1                   
let g:bracey_server_port=8080 

"----------------------------------
"---------------------------------- RANGER
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
nmap <space>rg :RnvimrToggle<CR>

"--------------------------------
"-------------------------------- EASY MOTION
nmap s <Plug>(easymotion-s2)

"----------------------------------
"---------------------------------- NERDTREE
let NERDTreeQuitOnOpen=1
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>nn :NERDTreeToggle<CR>
" nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>e :CocCommand explorer<CR>

" NERDTreeGitStatusUseNerdFonts
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeGitStatusShowIgnored = 1 
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"--------------------------------
"-------------------------------- KEYMAPS
" execute "set <M-h>=\eh"
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" execute "set <M-l>=\el"

" inoremap ji <ESC>

vnoremap p "_dP

nmap <Leader>ww :w!<CR>
nmap <Leader>wa <cmd>execute ':wa' <bar> wq<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>ws <cmd>execute ':silent! w !sudo tee % > /dev/null' <bar> edit!<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>Q :qa!<CR>

map <Leader>ll :setlocal spell! spelllang=en_us<CR>

" Enable and disable  autocoment
map <Leader>dc :setlocal formatoptions-=cro<CR>
map <Leader>ec :setlocal formatoptions=cro<CR>

nmap <Leader>rp :%s//gIc<Left><Left><Left><Left>

nnoremap <C-j> J
nnoremap <C-k> K

nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {

vnoremap > >gv
vnoremap < <gv

nnoremap n nzz
nnoremap N Nzz

nnoremap U <C-r>

command! Reload execute "source ~/.vimrc"
nnoremap <C-r> :Reload<CR>

nnoremap <Leader>sc :Colors<CR>
nnoremap <Leader>sh :History<CR>

" more commands
nnoremap ,s /
nnoremap ,e :e .env<CR>
nnoremap ,r :e requests.http<CR>

nnoremap <C-l> :noh<CR>

nnoremap <Leader>d :tab DBUI<CR>

" Move text up and down
vnoremap <M-j> :move '>+1<CR>gv-gv 
vnoremap <M-k> :move '<-2<CR>gv-gv 

"--------------------------------
"-------------------------------- TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set smarttab
set expandtab

"----------------------------------
"---------------------------------- SPLITS
" Remove pipes
set fillchars+=vert:\ "

" Splits
nnoremap <Leader>h :split<CR>
nnoremap <Leader>v :vsplit<CR>
"resize splits
nnoremap <silent> <Leader>< :vertical resize +5<CR>
nnoremap <silent> <Leader>> :vertical resize -5<CR>
nnoremap <silent> <Leader>+ :resize +3<CR>
nnoremap <silent> <Leader>- :resize -3<CR>
nnoremap <silent> <C-w><C-e> <C-w>=

" Splits navigation
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Change splits from vertical to horizontal or vice versa
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Swap split
map <C-x> <C-w>R

"----------------------------------
"---------------------------------- TERMINAL

map <Leader>trm :terminal<CR>
map <Leader>trh :new term://zsh<CR>
map <Leader>trv :vnew term://zsh<CR>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Splits navigation from terminal
tnoremap <C-j>  <C-\><C-n><C-w>j
tnoremap <C-k>  <C-\><C-n><C-w>k
tnoremap <C-l>  <C-\><C-n><C-w>l
tnoremap <C-h>  <C-\><C-n><C-w>h
" Resize splits from terminal
tnoremap <silent> <C-Up> :resize +3<CR>
tnoremap <silent> <C-Down> :resize -3<CR>
tnoremap <silent> <C-Left> :vertical resize +5<CR>
tnoremap <silent> <C-Right> :vertical resize -5<CR>

"----------------------------------
"---------------------------------- BUFFERS
map <S-h> :bprevious<CR>
map <S-l> :bnext<CR>
map <Leader>c :bdelete<CR>
map <Leader>o :on<CR>

"--------------------------------
"-------------------------------- FUNCTIONS

" Remember line number
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Fix cursor
if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif

"Toggle relative line numbers
function! RelativeNumberToggle()
  set relativenumber!
endfunction
" more command
noremap <silent> ,tn <cmd>call RelativeNumberToggle()<CR>

"Toggle Wrap mode
function! WrapToggle()
  set wrap!
endfunction
" more command
noremap <silent> ,tw <cmd>call WrapToggle()<CR>

function! Test()
  echo "my fun"
endfunction

"--------------------------------
"-------------------------------- CUSTOM MODES
function! NormalMode()
  if exists('b:WindowsMode')
    unlet b:WindowsMode
  elseif exists('b:MarkdownMode')
    unlet b:MarkdownMode
  endif
  colorscheme codedark
endfunction
noremap <C-i> <cmd>call NormalMode()<CR>

"--- WINDOWS MODE

function! WindowsMode()
  let b:WindowsMode=1
  colorscheme onedark
endfunction
nnoremap <silent> mhw <cmd>call WindowsMode()<Cr>

" Resize
nnoremap <expr> < exists('b:WindowsMode') ? ':vertical resize +5<CR>' : '<' 
nnoremap <expr> > exists('b:WindowsMode') ? ':vertical resize -5<CR>' : '>' 
nnoremap <expr> + exists('b:WindowsMode') ? ':resize +3<CR>' : '+' 
nnoremap <expr> - exists('b:WindowsMode') ? ':resize -3<CR>' : '-' 
nnoremap <expr> = exists('b:WindowsMode') ? '<C-w>=' : '=' 

" Scroll
nnoremap <expr> h exists('b:WindowsMode') ? '7zh' : 'h' 
nnoremap <expr> l exists('b:WindowsMode') ? '7zl' : 'l' 
nnoremap <expr> k exists('b:WindowsMode') ? '7<C-y>' : 'k' 
nnoremap <expr> j exists('b:WindowsMode') ? '7<C-e>' : 'j' 

"--- MARKDOWN MODE

function! MarkdownMode()
  let b:MarkdownMode=1
  colorscheme onedark
endfunction
nnoremap <silent> mhm <cmd>call MarkdownMode()<Cr>

let g:mkdp_browser = "surf"
let g:mkdp_open_to_the_world = 1
let g:mkdp_port = "57843"

" Index
nnoremap <expr> II exists('b:MarkdownMode') ? '<C-w>h' : 'II' 
nnoremap <expr> IP exists('b:MarkdownMode') ? '<cmd>Toc<CR><C-w>H<cmd>vertical resize 30<CR><CR>' : 'IP' 
nnoremap <expr> gi exists('b:MarkdownMode') ? ':GenTocGFM<CR>' : 'gi' 

" -- Nav
nnoremap <expr> j exists('b:MarkdownMode') ? '<Plug>Markdown_MoveToNextHeader' : 'j' 
nnoremap <expr> k exists('b:MarkdownMode') ? '<Plug>Markdown_MoveToPreviousHeader' : 'k' 
nnoremap <expr> l exists('b:MarkdownMode') ? '<Plug>Markdown_MoveToNextSiblingHeader' : 'l' 
nnoremap <expr> h exists('b:MarkdownMode') ? '<Plug>Markdown_MoveToPreviousSiblingHeader' : 'h' 
" { 'ge', '<Plug>Markdown_EditUrlUnderCursor', { silent = true } },
" { 'gu', '<Plug>Markdown_MoveToParentHeader', { silent = true } },
" { 'gx', '<Plug>Markdown_OpenUrlUnderCursor', { desc = "<-Nav|", silent = true } },

" -- Mode
" { 'gm', ':set filetype=markdown<CR>', { silent = true } },
" { 'gw', ':set filetype=vimwiki<CR>', { silent = true } },
nnoremap <expr> P exists('b:MarkdownMode') ? ':MarkdownPreviewToggle<CR>' : 'P' 
nnoremap <expr> T exists('b:MarkdownMode') ? ':TableModeToggle<CR>' : 'T' 
" { 'X', '<cmd>Toc<CR><C-w>H<cmd>vertical resize 20<CR><CR> \
" | :TableModeEnable<CR> \
" | :MarkdownPreviewToggle<CR>', { desc = "<-Mode|", silent = true } },

" -- Resize
" { 'F', '<cmd>TableFormat<CR>', { desc = "<-Format|", silent = true } },

" -- Resize
" { '+', ':HeaderIncrease<CR>', { silent = true } },
" { '-', ':HeaderDecrease<CR>', { desc = "<-Resize|", silent = true } },

"--------------------------------
"-------------------------------- COC

"TextEdit fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
 set nobackup
 set nowritebackup

 " Give more space for displaying messages.
 set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
 set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
 if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 " other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
call CocActionAsync('doHover')
else
execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
"
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>

" nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>"

"--------------------------------
"-------------------------------- COC-EXPLORER

nmap <space>e :CocCommand explorer<CR>
" nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

"--------------------------------
"-------------------------------- VIM WIKI

let tech_wiki = {}
let tech_wiki.path = '~/vimwiki/tech_docs/'
let tech_wiki.index = 'index'
let tech_wiki.html_template = '~/public_html/template.tpl'
let tech_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'javascript': 'js', 'ruby': 'rb'}
let tech_wiki.auto_diary_index = 1
let tech_wiki.syntax = 'markdown'
let tech_wiki.ext = '.md'

let personal_wiki = {}
let personal_wiki.path = '~/vimwiki/personal_docs/'
let personal_wiki.index = 'main'
let personal_wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'javascript': 'js', 'ruby': 'rb'}
let personal_wiki.auto_diary_index = 1
let personal_wiki.syntax = 'markdown'
let personal_wiki.ext = '.md'

let shopping_wiki = {}
let shopping_wiki.path = '~/vimwiki/shopping_docs/'
let shopping_wiki.index = 'main'
let shopping_wiki.auto_diary_index = 1
let shopping_wiki.syntax = 'markdown'
let shopping_wiki.ext = '.md'

let g:vimwiki_list = [personal_wiki, tech_wiki, shopping_wiki]
let g:vimwiki_markdown_link_ext = 1

" let g:vimwiki_listsyms = ' ○✗'

"--------------------------------
"-------------------------------- SESSIONS

" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction

" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
" autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()

"--------------------------------
"-------------------------------- KEYMAPS
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Define prefix dictionary
let g:which_key_map =  {}

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be
" feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
        \ },
      \ }

nnoremap <silent> wt  :VimwikiMakeDiaryNote<CR>
nnoremap <silent> wi  :VimwikiDiaryIndex<CR>
nnoremap <silent> wu  :VimwikiDiaryGenerateLinks<CR>
nnoremap <silent> wx  :VimwikiUISelec<CR>
nnoremap <silent> wk  :VimwikiIndex<CR>

