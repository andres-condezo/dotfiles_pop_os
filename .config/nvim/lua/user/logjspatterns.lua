local M = {}

M.register = "o"
M.plugin_prefix = "💬"
M.file_patterns = {
	javascript = {
		file_types = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},
		function_patterns = {
			"function%s+(%w+)%s*%(",
			"var%s+(%w+)%s*=%s*function%s*%(",
			"const%s+(%w+)%s*=%s*function%s*%(",
			"var%s+(%w+)%s*=%s*%(%s*%)%s*=>%s*{",
			"const%s+(%w+)%s*=%s*%(.*%)%s*=>%s*{",
		},
		comment_sign = "//",
		concat_sign = ",",
		closing_output_method = ";",
		output_method = "console.log",
		quote = "'",
	},
	lua = {
		file_types = {
			"lua",
		},
		function_patterns = {
			"function%s+([_%w]+)%s*%(",
			"local%s+([_%w]+)%s*=%s*function",
			"local%s+([_%w]+)%s*=%s*%(%s*%)%s*-%s*>",
		},
		comment_sign = "--",
		concat_sign = "..",
		closing_output_method = "",
		output_method = "print",
		quote = '"',
	},
	ruby = {
		file_types = {
			"ruby",
			"erb",
			"html.erb",
			"html+ruby",
			"html+ruby+erb",
			"html+erb",
			"html+ruby+eex",
			"html+eex",
			"html+ruby+leex",
			"html+leex",
			"html+ruby+slim",
			"html+slim",
			"html+ruby+haml",
			"html+haml",
		},
		function_patterns = {
			"def%s+([_%w]+)",
		},
		comment_sign = "#",
		output_method = "p",
		concat_sign = ",",
		closing_output_method = "",
		quote = "'",
	},
	python = {
		file_types = {
			"python",
			"python3",
			"python2",
			"python3.8",
			"python3.7",
			"python3.6",
			"python3.5",
			"python3.4",
			"python3.3",
		},
		function_patterns = {
			"def%s+([_%w]+)",
		},
		comment_sign = "#",
		output_method = "print",
		concat_sign = "+",
		closing_output_method = "",
		quote = "'",
	},
}

return M
