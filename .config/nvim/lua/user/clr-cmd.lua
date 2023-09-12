-- Clean Comand Line --

-- Shorten function name
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Clear comand line
_G.clearCmd = function ()
  vim.fn.timer_start(12000, function()
    vim.cmd('echo')
  end)
end

vim.cmd "autocmd CmdlineLeave,BufWrite * execute 'lua clearCmd()'"

_G.clear_undo = function()
  vim.cmd('undo')
  vim.cmd('lua clearCmd()')
end

_G.clear_redo = function()
  vim.cmd('redo')
  vim.cmd('lua clearCmd()')
end

-- Clear messages
-- vim.keymap.set("n", "<leader>ñ", function() print(" ") end)

-- redo and undo
keymap("n", "<C-r>", ":lua clear_redo()<CR>", opts)
keymap("n", "U", ":lua clear_redo()<CR>", opts)
keymap("n", "u", ":lua clear_undo()<CR>", opts)
