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
         vim.cmd "colorscheme everforest"
      end,
      on_exit = function()
         vim.cmd "colorscheme darkplus"
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = 'mk',
   heads = {
      -- Motion
      { 'L', ':VimwikiFollowLink<CR>', { silent = true } },
      { 'H', ':VimwikiGoBackLink<CR>', { silent = true } },
      { 'J', ':VimwikiNextLink<CR>', { silent = true } },
      { 'K', ':VimwikiPrevLink<CR>', { desc = "<-Motion|", silent = true } },

      -- Quit
      { '<Esc>', nil,  { exit = true }},
      { 'q', nil, { exit = true, nowait = true } },
   }
})

vim.cmd [[
  let g:vimwiki_list = [{'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_markdown_link_ext = 1

  "-----

    " let wiki_1 = {}
    " let wiki_1.path = '~/my_docs/'
    " let wiki_1.html_template = '~/public_html/template.tpl'
    " let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
    "
    " let wiki_2 = {}
    " let wiki_2.path = '~/project_docs/'
    " let wiki_2.index = 'main'
    "
    " let g:vimwiki_list = [wiki_1, wiki_2]
]]
