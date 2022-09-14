local status_ok, pickers = pcall(require, "telescope.pickers")
if not status_ok then return end    -- if telescope not installed, return

local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

telescope_vimwiki_categories_picker = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "VimWiki Categories",
        finder = finders.new_table {
            results = vim.g.vw_categories
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ "<!-- category: " .. selection[1] .. " -->", "" }, "", false, true)
            end)
            return true
        end,
    }):find()
end
