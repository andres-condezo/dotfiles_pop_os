local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.onedark")
if not status_theme_ok then
  return
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#D4D4D4", bg = "#303030", bold = false })
-- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D4D4D4", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#808080", bg = "none" })
local mode_color = {
  n = "#252525",
  -- n = "#569cd6",
  i = "#6a9955",
  v = "#c586c0",
  [""] = "#c586c0",
  V = "#c586c0",
  c = "#4EC9B0",
  no = "#569cd6",
  s = "#ce9178",
  S = "#ce9178",
  [""] = "#ce9178",
  ic = "#dcdcaa",
  R = "#d16969",
  Rv = "#d16969",
  cv = "#569cd6",
  ce = "#569cd6",
  r = "#d16969",
  rm = "#4EC9B0",
  ["r?"] = "#4EC9B0",
  ["!"] = "#4EC9B0",
  t = "#D7BA7D",
}

local mode = {
  -- mode component
  function()
    return "▊"
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()], bg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { right = 1 },
  padding = 0,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

-- local mode = {
--   "mode",
--   fmt = function(str)
--     return "-- " .. str .. " --"
--   end,
-- }

local filetype = {
  "filetype",
  icons_enabled = true,
  colored = true,
  -- icon = nil,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  colored = true,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

-- local current_signature = function()
--   if not pcall(require, "lsp_signature") then
--     return
--   end
--   local sig = require("lsp_signature").status_line(30)
--   -- return sig.label .. "🐼" .. sig.hint
--   return "%#SLSeparator#" .. sig.hint .. "%*"
-- end

-- cool function for progress
-- local progress = function()
--   local current_line = vim.fn.line "."
--   local total_lines = vim.fn.line "$"
--   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--   -- return chars[index]
--   return "%#SLProgress#" .. chars[index] .. "%*"
-- end

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

local location = {
  "location",
  color = function()
    return { fg = "white", bg = "#252525" }
  end,
}

local nvim_tree_shift = {
  function()
      local len = vim.api.nvim_win_get_width(require('nvim-tree.view').get_winnr()) - 1
      local title = " "
      local left = (len - #title) / 2
      local right = len - left - #title

      return string.rep(' ', left) .. title .. string.rep(' ', right)
  end,
  cond = require('nvim-tree.view').is_visible,
  color = function()
    return { fg = "white", bg = "none" }
  end,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "auto",
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { nvim_tree_shift, mode, branch },
    lualine_b = { diagnostics },
    lualine_c = {},
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = { diff, spaces, filetype, "fileformat", "encoding" },
    lualine_y = { "progress" },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { location },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
