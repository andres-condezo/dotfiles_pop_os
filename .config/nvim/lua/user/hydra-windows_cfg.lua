local Hydra = require('hydra')

Hydra({
   config = {
      timeout = 8000,
      hint = {
         border = 'rounded'
      }
   },
   mode = 'n',
   body = 'mhw',
   heads = {
      -- Move focus
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', '<C-w>k' },
      { 'l', '<C-w>l', { desc = 'focus' } },

      -- Move window
      { 'H', '<Cmd>WinShift left<CR>' },
      { 'J', '<Cmd>WinShift down<CR>' },
      { 'K', '<Cmd>WinShift up<CR>' },
      { 'L', '<Cmd>WinShift right<CR>', { desc = 'shift' } },

      -- Split
      { 's', '<C-w>s' },
      { 'v', '<C-w>v' },
      { 'c', '<Cmd>try | close | catch | endtry<CR>', { desc = 'split' } },

      -- Size
      { '+', '<C-w>+' },
      { '-', '<C-w>-' },
      { '>', '2<C-w>>' },
      { '<', '2<C-w><' },
      { 'e', '<C-w>=', { desc = 'resize'} },

      -- Scroll
      { '<A-h>', '7zh' },
      { '<A-l>', '7zl' },
      { '<A-k>', '7<C-y>' },
      { '<A-j>', '7<C-e>', { desc = 'scroll'} },

      -- Exit
      { 'q', nil,  { exit = true }, { desc = 'exit' } },
      { '<Esc>', nil,  { exit = true }},
   }
})
