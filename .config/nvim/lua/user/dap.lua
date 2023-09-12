local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

dap_install.setup({})


dap_install.config("python", {})

-- add other configs here

-- dap_install.config("jsnode", {})

-- dap_install.config("javascript", {})

-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { "~/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" },
-- }
--
-- dap.configurations.javascript = {
-- 	{
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${workspaceFolder}/${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- }

dapui.setup({
	expand_lines = true,
	icons = { expanded = "", collapsed = "", circular = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.33 },
				{ id = "breakpoints", size = 0.17 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 0.33,
			position = "right",
		},
		{
			elements = {
				-- { id = "repl", size = 0.45 },
				{ id = "repl", size = 0.01 },
				{ id = "console", size = 0.55 },
			},
			size = 0.1,
			-- size = 0.27,
			position = "bottom",
		},
	},
	floating = {
		max_height = 0.9,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end




-- require('dap-vscode-js').setup({
--     debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
--     debugger_cmd = { 'js-debug-adapter' },
--     adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
-- })
--
-- local dap = require('dap')
--
-- -- custom adapter for running tasks before starting debug
-- local custom_adapter = 'pwa-node-custom'
-- dap.adapters[custom_adapter] = function(cb, config)
--     if config.preLaunchTask then
--         local async = require('plenary.async')
--         local notify = require('notify').async
--
--         async.run(function()
--             ---@diagnostic disable-next-line: missing-parameter
--             notify('Running [' .. config.preLaunchTask .. ']').events.close()
--         end, function()
--             vim.fn.system(config.preLaunchTask)
--             config.type = 'pwa-node'
--             dap.run(config)
--         end)
--     end
-- end
--
-- -- language config
-- for _, language in ipairs({ 'typescript', 'javascript' }) do
--     dap.configurations[language] = {
--         {
--             name = 'Launch',
--             type = 'pwa-node',
--             request = 'launch',
--             program = '${file}',
--             rootPath = '${workspaceFolder}',
--             cwd = '${workspaceFolder}',
--             sourceMaps = true,
--             skipFiles = { '<node_internals>/**' },
--             protocol = 'inspector',
--             console = 'integratedTerminal',
--         },
--         {
--             name = 'Attach to node process',
--             type = 'pwa-node',
--             request = 'attach',
--             rootPath = '${workspaceFolder}',
--             processId = require('dap.utils').pick_process,
--         },
--         {
--             name = 'Debug Main Process (Electron)',
--             type = 'pwa-node',
--             request = 'launch',
--             program = '${workspaceFolder}/node_modules/.bin/electron',
--             args = {
--                 '${workspaceFolder}/dist/index.js',
--             },
--             outFiles = {
--                 '${workspaceFolder}/dist/*.js',
--             },
--             resolveSourceMapLocations = {
--                 '${workspaceFolder}/dist/**/*.js',
--                 '${workspaceFolder}/dist/*.js',
--             },
--             rootPath = '${workspaceFolder}',
--             cwd = '${workspaceFolder}',
--             sourceMaps = true,
--             skipFiles = { '<node_internals>/**' },
--             protocol = 'inspector',
--             console = 'integratedTerminal',
--         },
--         {
--             name = 'Compile & Debug Main Process (Electron)',
--             type = custom_adapter,
--             request = 'launch',
--             preLaunchTask = 'npm run build-ts',
--             program = '${workspaceFolder}/node_modules/.bin/electron',
--             args = {
--                 '${workspaceFolder}/dist/index.js',
--             },
--             outFiles = {
--                 '${workspaceFolder}/dist/*.js',
--             },
--             resolveSourceMapLocations = {
--                 '${workspaceFolder}/dist/**/*.js',
--                 '${workspaceFolder}/dist/*.js',
--             },
--             rootPath = '${workspaceFolder}',
--             cwd = '${workspaceFolder}',
--             sourceMaps = true,
--             skipFiles = { '<node_internals>/**' },
--             protocol = 'inspector',
--             console = 'integratedTerminal',
--         },
--     }
-- end

-- current

require("dap-vscode-js").setup({
  node_path = os.getenv('HOME') .. '/.nvm/versions/node/v16.14.0/bin/node',
  debugger_path = os.getenv('HOME') .. '/vscode-js-debug/',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

-- for _, language in ipairs { "typescript", "javascript" } do
--   dap.configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Debug Jest Tests",
--       -- trace = true, -- include debugger info
--       runtimeExecutable = "node",
--       runtimeArgs = {
--         "./node_modules/jest/bin/jest.js",
--         "--runInBand",
--       },
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       console = "integratedTerminal",
--       internalConsoleOptions = "neverOpen",
--     },
--   }
-- end

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
   {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    sourceMaps = true,
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  },

  -- {
  --   type = "pwa-node",
  --   request = "attach",
  --   name = "Attach",
  --   processId = require'dap.utils'.pick_process,
  --   cwd = "${workspaceFolder}",
  -- }
	}
end

-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { "~/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" },
-- }

-- dap.configurations.javascript = {
-- 	{
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${workspaceFolder}/${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- }
--
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- require("dap-vscode-js").setup {
--   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
-- }
--
-- for _, language in ipairs { "typescript", "javascript" } do
--   dap.configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Debug Jest Tests",
--       -- trace = true, -- include debugger info
--       runtimeExecutable = "node",
--       runtimeArgs = {
--         "./node_modules/jest/bin/jest.js",
--         "--runInBand",
--       },
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       console = "integratedTerminal",
--       internalConsoleOptions = "neverOpen",
--     },
--   }
-- end
