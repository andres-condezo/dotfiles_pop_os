local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "x", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local more_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local more_v_opts = {
  mode = "x", -- VISUAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local w_opts = {
  mode = "n", -- NORMAL mode
  prefix = "w",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = { "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({}))<cr>",
  "Buffers list" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files({layout_strategy='horizontal',layout_config={width=0.9}})<cr>",
    "Find files" },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["o"] = { "<cmd>BufCurOnly<cr>", "Close all buffers except Current one" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["Q"] = { "<cmd>qa!<CR>", "Close all windows" },

  d = {
    name = "DAP",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "db"},
    c = { "<cmd>lua require'dap'.continue()<cr>", "dc"},
  },

  g = {
    name = "Git",
    f = { "<cmd>:topleft vertical Git<CR><cmd>vertical resize 45<CR>", "Git state" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  m = {
    name = "Session",
    c = { "<cmd>SessionManager load_current_dir_session<cr>", "Load current session" },
    d = { "<cmd>SessionManager delete_session<cr>", "Delete session" },
    l = { "<cmd>SessionManager load_session<cr>", "Load session" },
    s = { "<cmd>lua savedSession()<CR>", "Save session" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope command_history<cr>", "Command history" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>TodoTelescope<cr>", "Todos" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  w = {
    name = "Save",
    a = { "<cmd>wa | :qa<CR>", "Save all buffer and exit" },
    e = { "<cmd>wq<CR>", "Save current buffer and close it" },
    s = { "<cmd>execute 'silent! :w !sudo tee % > /dev/null' | edit!<CR>", "Save with sudo permission" },
    w = { "<cmd>w!<CR>", "Save current buffer" },
  },

  x = {
    name = "Run code",
    c = { "<Plug>SnipClose", "Close SnipRun"},
    d = { "<cmd>FineCmdline<CR>Codi ", "Codi run code"},
    p = { "<cmd>Jaq<CR>G", "Jaq run code"},
    x = { "<Plug>SnipRun", "SnipRun run code"},
    z = { "<Plug>SnipReset", "Reset SnipRun"},
  },
}

local more_mappings = {
  ["c"] = { "<cmd>:Telescope neoclip<CR>jk", "Neo clip" },
  ["n"] = { "<cmd>Telescope notify<CR>", "Show notifications" },
  ["r"] = { ":SearchBoxReplace confirm=menu<CR>", "Replace" },
  ["s"] = { ":SearchBoxMatchAll clear_matches=true<CR>", "Search" },
  ["$"] = { "<cmd>lua showDate()<CR>jk", "Show date and time" },

  f = {
    name = "Folds",
    a = { "zfa", "Fold all ..."},
    c = { "zM | zo | zz", "Fold all except current one"},
    d = { "<cmd>:autocmd! Ufo TextChanged * | :autocmd! Ufo InsertLeave * | :autocmd! Ufo BufWritePost * | :autocmd! Ufo CmdlineLeave *  <CR>", "Fold OnChange Disabled" },
    f = { "zM", "Close all folds" },
    l = { "<cmd>:loadview<CR>", "Load folds"},
    n = { "<cmd>:lua require'user.toggleOpt'.toggleFoldCol()<CR>", "Toggle fold column" },
    o = { "zO", "Open all folds under cursor" },
    r = { "zR | zz", "Open all folds" },
  },

  h = {
    name = "highlight",
    z = { "<cmd>:lua require('hlargs').setup()<CR>", "Highlight args" },
    p = { "<cmd>:lua require('hlargs').toggle()<CR>", "Toggle highlight args" },
  },

  m = {
    name = "more",
    e = { "<cmd>:e .env<CR>", "Env file" },
    r = { "<cmd>:e requests.http<CR>", "Request file" },
  },

  t = {
    name = "Toggle",
    c = { "<cmd>:lua require'user.toggleOpt'.toggleCalendar()<CR>", "Toggle Calendar" },
    f = { "<cmd>:lua require'user.toggleOpt'.toggleFoldCol()<CR>", "Toggle fold column" },
    n = { "<cmd>:lua require'user.toggleOpt'.toggleRelativeNumber()<CR>", "Toggle relative numbers" },
    t = { "<cmd>:lua require'user.toggleOpt'.toggleTabLine()<CR>", "Toggle Tabline" },
    w = { "<cmd>:lua require'user.toggleOpt'.toggleWrap()<CR>", "Toggle Wrap" },
  },

  z = {
    name = "Zen",
    a = { "<cmd>:TZAtaraxis<CR>", "Ataraxis mode" },
    f = { "<cmd>:TZFocus<CR>", "Focus mode" },
    m = { "<cmd>:TZMinimalist<CR>", "Minimalist mode" },
    t = { "<cmd>:Twilight<CR>", "Twilight mode" },
    z = { "<cmd>ZenMode<CR>", "Zen mode" },
  },

}

local v_mappings = {
  s = {
    name = "Search",
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope command_history<cr>", "Command history" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  x = {
    name = "Run code",
    x = { "<Plug>SnipRun", "Run code"},
    c = { "<Plug>SnipClose", "Close SnipRun"},
    z = { "<Plug>SnipReset", "Reset SnipRun"},
  },
}

local more_v_mappings = {
  ["s"] = { ":SearchBoxMatchAll clear_matches=true<CR>", "Search" },
  ["r"] = { "<cmd>SearchBoxReplace confirm=menu visual_mode=true<CR>", "Replace" },
}

local w_mappings = {
  ["d"] = { "<Plug>VimwikiDeleteFile", "Delete file" },
  ["k"] = { "<Plug>VimwikiIndex", "VimWiki index" },
  ["i"] = { "<Plug>VimwikiDiaryIndex", "VimWiki diary index" },
  ["t"] = { "<Plug>VimwikiMakeDiaryNote", "Today's diary" },
  ["y"] = { "<Plug>VimwikiMakeYesterdayDiaryNote", "Yesterday's diary" },
  ["m"] = { "<Plug>VimwikiMakeTomorrowDiaryNote", "Tomorrow's diary" },
  ["u"] = { "<Plug>VimwikiDiaryGenerateLinks", "Wiki UI Select" },
  ["x"] = { "<cmd>VimwikiUISelec<CR>", "Wiki UI Select" },
  ["n"] = { "<Plug>VimwikiNextLink" }
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(v_mappings, v_opts)
which_key.register(more_mappings, more_opts)
which_key.register(more_v_mappings, more_v_opts)
which_key.register(w_mappings,w_opts)
