local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require("alpha.themes.dashboard")
-- local icons = require("icons")
local fn = vim.fn
local config_dir = fn.stdpath('config')

-- ╭──────────────────────────────────────────────────────────╮
-- │ Header                                                   │
-- ╰──────────────────────────────────────────────────────────╯

-- local header = {
--   [[                                                 ]],
--   [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
--   [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
--   [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
--   [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
--   [[██   ████ ███████  ██████    ████   ██ ██      ██]],
--   [[                                                 ]],
-- }

local header = {
  [[                                 ]],
  [[███    ██  ██    ██ ██ ███    ███]],
  [[████   ██  ██    ██ ██ ████  ████]],
  [[██  ██ ██   ██  ██  ██ ██  ██  ██]],
  [[██   ████    ████   ██ ██      ██]],
  [[                                 ]],
}
dashboard.section.header.type = "text";
dashboard.section.header.val = header;
dashboard.section.header.opts = {
  position = "center",
  hl = "Include",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Heading Info                                             │
-- ╰──────────────────────────────────────────────────────────╯

local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
if thingy == nil then return end
local date = thingy:read("*a")
thingy:close()


local middle = {
  [[                                                 ]],
  "                    " .. date .. "              ",
  [[                                                 ]],
  [[                                                 ]],
}
local hi_top_section = {
  type = "text",
  val =  middle,
  opts = {
    position = "center",
    hl = "Type"
  }
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Buttons                                                  │
-- ╰──────────────────────────────────────────────────────────╯

dashboard.section.buttons.val = {
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", " " .. " Find file", ":lua require('telescope.builtin').find_files({hidden = true})<CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  -- dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("s", " " .. " Find session", ":SessionManager load_session<CR>"),
  dashboard.button("d", " " .. " Database", ":colorscheme kanagawa | :tab DBUI<cr>"),
  dashboard.button("K", " " .. " Wiki UI Select", ":VimwikiUISelec<CR>"),
  -- dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Footer                                                   │
-- ╰──────────────────────────────────────────────────────────╯

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function line_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local function footer()
  local v = vim.version()
  return string.format(" v%d.%d.%d", v.major, v.minor, v.patch)
end

dashboard.section.footer.val = {
  footer()
}
dashboard.section.footer.opts = {
  position = "center",
  hl = "Type",
}

local section = {
  header = dashboard.section.header,
  hi_top_section = hi_top_section,
  buttons = dashboard.section.buttons,
  footer = dashboard.section.footer,
}

local opts = {
  layout = {
    {type = "padding", val = 2},
    section.header,
    {type = "padding", val = 0},
    section.hi_top_section,
    {type = "padding", val = 0},
    section.buttons,
    {type = "padding", val = 2},
    section.footer,
  },
  opts = {
    margin = 0
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯

alpha.setup(opts)

-- ╭──────────────────────────────────────────────────────────╮
-- │ Hide tabline and statusline on startup screen            │
-- ╰──────────────────────────────────────────────────────────╯
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})

