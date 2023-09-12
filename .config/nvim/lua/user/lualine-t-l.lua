local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.onedark")
if not status_theme_ok then
  return
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "black", bg = "white" })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "black", bg = "white", bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "black", bg = "white" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "black", bg = "white" })
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
  color = function()
    return { fg = "black", bg = "white" }
  end,
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

local diff = {
  "diff",
  color = function()
    return { fg = "black", bg = "white" }
  end,
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

-- local mode = {
--   "mode",
--   fmt = function(str)
--     return "-- " .. str .. " --"
--   end,
-- }

local filetype = {
  "filetype",
  color = function()
    return { fg = "black", bg = "white" }
  end,
  icons_enabled = true,
  colored = false,
  -- icon = nil,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

local branch = {
  color = function()
    return { fg = "black", bg = "white" }
  end,
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  colored = false,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

-- local current_signature = function()
--   if not pcall(require, "lsp_signature") then
--     return
--   end
--   local sig = require("lsp_signature").status_line(30)
--   -- return sig.label .. "🐼" .. sig.hint
--   return "%#SLSeparator#" .. sig.hint .. "%*"
-- end

local spaces = {
  color = function()
    return { fg = "black", bg = "white" }
  end,
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
  "location",
  color = function()
    return { fg = "black", bg = "white" }
  end,
}

local progress = {
  "progress",
  color = function()
    return { fg = "black", bg = "white" }
  end,
}

local fileformat = {
  "fileformat",
  color = function()
    return { fg = "black", bg = "white" }
  end,
}

local encoding = {
  "encoding",
  color = function()
    return { fg = "black", bg = "white" }
  end,
}

-- local buffers = {
--   "buffers",
--   color = function()
--     return { fg = "white", bg = "none" }
--   end,
-- }

local filename = {
  "filename",
  color = function()
    return { fg = "black", bg = "white" }
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
    return { fg = "black", bg = "white" }
  end,
}

local middle_shift = {
  function()
    local len =vim.api.nvim_win_get_width(0)-1
    local title = " "
    local left = (len - #title) / 2
    local right = len - left - #title
    Plus_width = 800

    -- return string.rep(' ', left) .. title .. string.rep(' ', right)
    return title .. string.rep(' ', (right + Plus_width))
  end,
  color = function()
    return { fg = "black", bg = "white" }
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
    disabled_filetypes = { "alpha", "dashboard"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { nvim_tree_shift, mode, branch },
    -- lualine_b = { diagnostics },
    lualine_b = { diagnostics, filename },
    lualine_c = { middle_shift },
    lualine_x = { diff, spaces, filetype, fileformat, encoding },
    lualine_y = { progress },
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
