local enabled_features = {
  "documentHighlights",
  "documentSymbols",
  "foldingRanges",
  "selectionRanges",
  -- "semanticHighlighting",
  "formatting",
  "codeActions",
}

local util = require("lspconfig.util")

return {
  settings = {
    default_config = {
			cmd = { "bundle", "exec", "ruby-lsp" },
			filetypes = { "ruby" },
			root_dir = util.root_pattern("Gemfile", ".git"),
			init_options = {
				enabledFeatures = enabled_features,
			},
			settings = {},
		},
		commands = {
			FormatRuby = {
				function()
					vim.lsp.buf.format({
						name = "ruby_lsp",
						async = true,
					})
				end,
				description = "Format using ruby-lsp",
			},
		},
  },
}
