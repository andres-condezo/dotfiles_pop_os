-- local colorscheme = "tokyonight-night"
-- local colorscheme = "darkplus"
-- local colorscheme = "kanagawa"
local colorscheme = "codedark"
-- local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
