local Hydra = require('hydra')

Hydra({
   config = {
      color = 'pink',
      invoke_on_body = true,
      on_enter = function()
         vim.cmd "let g:table_mode_corner='|'"
         vim.cmd "colorscheme gruvbox"
      end,
      on_exit = function()
         vim.cmd "colorscheme darkplus"
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = 'mhr',
   heads = {
      -- Motion
      { 'L', '<Plug>RestNvim | <C-w>l', { silent = true } },
      { 'H', '<C-w>h | 0', { silent = true } },
      { 'J', '/get {{\\|post {{\\|delete {{\\|get http\\|post http\\|delete http<CR>|:noh<CR>', { silent = true } },
      { 'K', '?get {{\\|post {{\\|delete {{\\|get http\\|post http\\|delete http<CR>|:noh<CR>', { desc = "<- Nav |", silent = true } },
      { 'F', '/HTTP<CR> | :noh<CR> | 0 | V | } | kk | zf', { silent = true } },
      { 'R', '?# <CR> | :noh<CR> | V | /#<CR> | zf | /get {{\\|post {{\\|delete {{\\|get http\\|post http\\|delete http<CR>|:noh<CR>', { silent = true } },
      { 'C', ':q<CR> | 0', { desc = "<- Close window |", silent = true } },
      { 'Z', ':loadview<CR>', { silent = true } },
      { 'M', ':mkview<CR>', { desc = "<- Folds |", silent = true } },

      -- Quit
      { '<Esc>', nil,  { exit = true }},
      { 'q', nil, { exit = true, nowait = true } },
   }
})
