
require'toggle_lsp_diagnostics'.init({
  underline = true,
  virtual_text = false,
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>Lu", "<Plug>(toggle-lsp-diag-underline)", opts)
keymap("n", "<leader>Ls", "<Plug>(toggle-lsp-diag-signs)", opts)
keymap("n", "<leader>Lv", "<Plug>(toggle-lsp-diag-vtext)", opts)
keymap("n", "<leader>Lp", "<Plug>(toggle-lsp-diag-update_in_insert)", opts)
keymap("n", "<leader>Ld", "<Plug>(toggle-lsp-diag)", opts)
-- keymap("n", "<leader>Ldd", "<Plug>(toggle-lsp-diag-default)", opts)
-- keymap("n", "<leader>Ldo", "<Plug>(toggle-lsp-diag-off)", opts)
-- keymap("n", "<leader>Ldf", "<Plug>(toggle-lsp-diag-on)", opts)
