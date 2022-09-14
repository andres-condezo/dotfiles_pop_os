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

function M.toggleWrap()
  if ( vim.opt.wrap:get() ) then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end

function M.toggleCalendar()
  vim.cmd [[
    execute ":Calendar"
    if exists("g:calendar_open")
      if g:calendar_open == 1
        execute "q"
        unlet g:calendar_open
      else
        g:calendar_open = 1
      end
    else
      let g:calendar_open = 1
    end
  ]]
end

return M
