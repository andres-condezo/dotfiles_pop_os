local opts = { noremap = true, silent = true }
local visual_opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

keymap("n", "<C-j>", "J", opts)
keymap("n", "<C-k>", "K", opts)

-- keymap("n", "<C-A-k>", "K", opts)

keymap("n", "J", "}", opts)
keymap("n", "K", "{", opts)
keymap("v", "J", "}", opts)
keymap("v", "K", "{", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Replace
keymap("n", "<Leader>r", ":%s//gIc<Left><Left><Left><Left>", visual_opts)

-- Splits
keymap("n", "<Leader>h", ":split<CR>", opts)
keymap("n", "<Leader>v", ":vsplit<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("v", "ñ", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste
keymap("v", "p", '"_dP', opts)

keymap("n", "n", 'nzz', opts)
keymap("n", "N", 'Nzz', opts)

-- Visual Block --

-- Move text up and down
keymap("v", "<C-A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<C-A-j>", ":move '>+1<CR>gv-gv", opts)

-- Plugins --

-- DAP
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- More --

-- keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", opts)
-- vim.g.copilot_no_tab_map = true

-- Reload source
keymap("n", "<A-r>", ":Reload<CR>", opts)

-- comand line
keymap('n', ',', '<cmd>FineCmdline<CR>', opts)

-- keymap('n', 'mmw', 'lua telescope_vimwiki_categories_picker()<CR>', opts)

keymap("n", "ñd", ":set background=dark<CR> | :source ~/.config/nvim/lua/user/lualine-t_cfg.lua<CR>", opts)
keymap("n", "ñl", ":set background=light<CR> | :source ~/.config/nvim/lua/user/lualine-t.lua<CR>", opts)
-- keymap("n", "ññ", ":colorscheme kanagawa<CR> | :set background=light<CR>", opts)
