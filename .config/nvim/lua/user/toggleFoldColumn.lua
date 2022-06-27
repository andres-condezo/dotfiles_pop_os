-- Toggle foldcolumn
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

return M
