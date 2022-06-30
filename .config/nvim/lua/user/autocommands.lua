-- Test function
_G.myTestFun = function ()
  local plugin = "My Awesome Plugin"

  vim.notify("This is an error message.\nSomething went wrong!", "error", {
    title = plugin,
    on_open = function()
      vim.notify("Attempting recovery.", vim.log.levels.WARN, {
        title = plugin,
      })
      local timer = vim.loop.new_timer()
      timer:start(2000, 0, function()
        vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
          title = plugin,
          timeout = 3000,
          on_close = function()
            vim.notify("Problem solved", nil, { title = plugin })
            vim.notify("Error code 0x0395AF", 1, { title = plugin })
          end,
        })
      end)
    end,
  })
end

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
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

-- Call reload to apply the latest init.lua contents
_G.savedSession = function ()
  vim.cmd(':SessionManager save_current_session')
  vim.notify("Saved session", "info", { title = "Session Manager" })
end

-- Show date and time
_G.showDate = function ()
  local dt = vim.fn.strftime "Date: %e-%b  /  Time: %H:%M"
  vim.notify(dt, "info", { timeout = 3000, render = "minimal" })
end

-- vim.cmd "autocmd BufWinLeave *.* mkview"
