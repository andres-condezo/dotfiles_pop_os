local Hydra = require('hydra')

Hydra({
   config = {
      color = 'pink',
      invoke_on_body = true,
      -- hint = {
      --    position = 'bottom',
      --    border = 'rounded'
      -- },
      on_enter = function()
         -- vim.bo.modifiable = false
         vim.cmd "let g:table_mode_corner='|'"
         vim.cmd "colorscheme material"
      end,
      on_exit = function()
         vim.cmd "colorscheme codedark"
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = 'mhm',
   heads = {
      -- Index
      { 'II', '<C-w>h', { silent = true } },
      { 'IP', '<cmd>Toc<CR><C-w>H<cmd>vertical resize 30<CR><CR>', { silent = true } },
      { 'gi', ':GenTocGFM<CR>', { desc = "<-Index|", silent = true } },

      -- Nav
      { 'J', '<Plug>Markdown_MoveToNextHeader', { silent = true } },
      { 'K', '<Plug>Markdown_MoveToPreviousHeader', { silent = true } },
      { 'L', '<Plug>Markdown_MoveToNextSiblingHeader', { silent = true } },
      { 'H', '<Plug>Markdown_MoveToPreviousSiblingHeader', { silent = true } },
      { 'ge', '<Plug>Markdown_EditUrlUnderCursor', { silent = true } },
      { 'gu', '<Plug>Markdown_MoveToParentHeader', { silent = true } },
      { 'gx', '<Plug>Markdown_OpenUrlUnderCursor', { desc = "<-Nav|", silent = true } },

      -- Mode
      { 'gm', ':set filetype=markdown<CR>', { silent = true } },
      { 'gw', ':set filetype=vimwiki<CR>', { silent = true } },
      { 'P', ':MarkdownPreviewToggle<CR>', { silent = true } },
      { 'T', ':TableModeToggle<CR>', { silent = true } },
      { 'X', '<cmd>Toc<CR><C-w>H<cmd>vertical resize 20<CR><CR> \
     | :TableModeEnable<CR> \
     | :MarkdownPreviewToggle<CR>', { desc = "<-Mode|", silent = true } },

      -- Resize
      { 'F', '<cmd>TableFormat<CR>', { desc = "<-Format|", silent = true } },

      -- Resize
      { '+', ':HeaderIncrease<CR>', { silent = true } },
      { '-', ':HeaderDecrease<CR>', { desc = "<-Resize|", silent = true } },

      -- Quit
      { '<Esc>', nil,  { exit = true }},
      { 'q', nil, { exit = true, nowait = true } },
   }
})
