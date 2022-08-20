local M = {}
local toBool = {
  ["1"] = true,
  ["0"] = false,
}

function M.toggleFoldCol()
  if toBool[vim.opt.foldcolumn:get()] then
    vim.opt.foldcolumn = "0"
  else
    vim.opt.foldcolumn = "1"
  end
end

function M.toggleRelativeNumber()
  if ( vim.opt.relativenumber:get() ) then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end

function M.toggleTabLine()
  if ( (vim.opt.showtabline:get()) == 0 ) then
    vim.opt.showtabline = 3
  else
    vim.opt.showtabline = 0
  end
end

return M
