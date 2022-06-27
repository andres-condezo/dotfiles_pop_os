vim.api.nvim_set_keymap(
  'n',
  ',ss',
  ':SearchBoxMatchAll clear_matches=true<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'x',
  ',ss',
  ':SearchBoxMatchAll clear_matches=true<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'n',
  ',sr',
  ':SearchBoxReplace confirm=menu<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'x',
  ',sr',
  ':SearchBoxReplace confirm=menu<CR>',
  {noremap = true}
)
