local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
 background_colour = "Normal",
 fps = 30,
 icons = {
   DEBUG = "",
   ERROR = "",
   INFO = "",
   TRACE = "✎",
   WARN = ""
 },
 level = 2,
 minimum_width = 50,
 render = "default",
 stages = "static",
 timeout = 3000
}

local log = require("plenary.log").new {
  plugin = "notify",
  level = "debug",
  use_console = false,
}

vim.notify = function (msg, level, opts)
  log.info(msg, level, opts)

  require "notify"(msg, level, opts)
end

require("telescope").load_extension("notify")
