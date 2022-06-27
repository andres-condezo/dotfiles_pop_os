local Hydra = require('hydra')

Hydra({
--    hint = [[
--  ^^^^^^     Move     ^^^^^^   ^^     Split         ^^^^    Size        ^^^   Scroll
--  ^^^^^^--------------^^^^^^   ^^---------------    ^^^^-------------   ^^^------------
--  ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    _s_: horizontally    _+_ _-_: height     ^ ^  _<A-k>_ ^ ^
--  _h_ ^ ^ _l_   _H_ ^ ^ _L_    _v_: vertically      _>_ _<_: width      _<A-h>_ _<A-l>_
--  ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _c_: close           ^ _=_ ^: equalize    ^ ^ _<A-j>_ ^ ^
--  focus^^^^^^   window^^^^^^
--  ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^    _b_: choose buffer   ^ ^ ^ ^    _<Esc>_  ^ ^ ^  _q_: exit
-- ]],
   config = {
      timeout = 4000,
      hint = {
         border = 'rounded'
      }
   },
   mode = 'n',
   body = 'w',
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
      { 'e', '<C-w>=', { desc = 'equalize'} },
      -- Scroll
      { '<A-h>', '7zh' },
      { '<A-l>', '7zl' },
      { '<A-k>', '7<C-y>' },
      { '<A-j>', '7<C-e>' },
      --
      { 'b', '<Cmd>BufExplorer<CR>', { exit = true, desc = 'choose buffer' } },
      { '<Esc>', nil,  { exit = true }},
      { 'q', nil,  { exit = true }},
   }
})
