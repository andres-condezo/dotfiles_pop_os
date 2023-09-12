vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit"},
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})


vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     vim.cmd [[
--       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
	local line_count = vim.api.nvim_buf_line_count(0)
		if line_count >= 5000 then
			vim.cmd("IlluminatePauseBuf")
		end
	end,
})

-- Delete all buffers except current one
vim.cmd "command! BufCurOnly execute '%bdelete|edit#|bdelete#'"

-- Call reload to apply the latest init.lua contents
_G.reloadSources = function ()
  vim.cmd('so %')
  vim.notify("Configuration reloaded", "info", { title = "NVim"})
end
vim.cmd "command! Reload execute 'lua reloadSources()'"

-- Save current session
_G.savedSession = function ()
  vim.cmd(':SessionManager save_current_session')
  vim.notify("Saved session", "info", { title = "Session Manager" })
end

-- Show date and time
_G.showDate = function ()
  local dt = vim.fn.strftime "Date: %e-%b  /  Time: %H:%M"
  vim.notify(dt, "info", { timeout = 3000, render = "minimal" })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "md", "markdown" },
  callback = function()
    vim.cmd [[
      set filetype=markdown
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "http" },
  callback = function()
    vim.cmd [[
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
    ]]
  end,
})


vim.api.nvim_command('au BufRead,BufNewFile *.csx set filetype=cs')
