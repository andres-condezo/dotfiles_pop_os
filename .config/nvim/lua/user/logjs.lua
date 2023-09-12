local file_patterns = require("user.logjspatterns").file_patterns
local plugin_prefix = require("user.logjspatterns").plugin_prefix
local register = require("user.logjspatterns").register

local function set_register(content)
	vim.fn.setreg(register, content)
end

local get_language = function()
	local file_type = vim.bo.filetype
	for language, patterns in pairs(file_patterns) do
		if vim.tbl_contains(patterns.file_types, file_type) then
			return language
		end
	end
	return 0
end

local get_function_name = function(language)
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	for line_number = current_line, 1, -1 do
		local current_text = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
		local function_patterns = file_patterns[language].function_patterns
		for _, pattern in ipairs(function_patterns) do
			local function_name = string.match(current_text, pattern)
			if function_name ~= nil then
				return function_name
			end
		end
	end
	return ""
end

local get_previous_tab_count = function()
	local line = vim.api.nvim_buf_get_lines(
		0,
		vim.api.nvim_win_get_cursor(0)[1] - 1,
		vim.api.nvim_win_get_cursor(0)[1],
		false
	)[1]
	if line == nil then
		return 0
	end
	local count = 0
	for i = 1, #line do
		if line:sub(i, i) == " " then
			count = count + 1
		else
			break
		end
	end
	return count
end

local get_current_selection = function()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local line_num = start_pos[2]
	local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
	local selection = string.sub(line, start_pos[3], end_pos[3])
	return selection
end

local get_register_content = function()
	local register_content = vim.fn.getreg(register)
	local content = register_content == "" and vim.fn.expand("<cword>") or string.sub(register_content, 1, -3)
	return content
end

-- TODO:
-- 1: iterate over the log_content and format it
-- "var1", var1, "var2", var2...
local get_printable_data = function(is_visual_mode, log_content, quote, concat_sign)
	local escaped_quote = "\\" .. quote
	local escaped_log_content = string.gsub(log_content, quote, escaped_quote)
	if not is_visual_mode then
		log_content = string.gsub(log_content, ",", concat_sign)
	end
	local variables = quote .. escaped_log_content .. ": " .. quote .. concat_sign .. log_content

	-- NOTE: Posible solution
	-- 	log_content = string.gsub(log_content, ", ", concat_sign)
	-- 	log_content = string.sub(log_content, 1, -3)
	-- 	local variables = ""
	-- 	if is_visual_mode then
	-- 		variables = log_content
	-- 	else
	-- 		local variable_table = {}
	-- 		for variable in string.gmatch(log_content, "([^,]+),") do
	-- 			table.insert(variable_table, quote .. variable .. ":" .. quote .. concat_sign .. escaped_log_content)
	-- 		end
	-- 		variables = table.concat(variable_table, concat_sign)
	-- 	end

	return variables
end

local get_log_message = function(is_visual_mode, language, output_method, quote)
	local log_content = is_visual_mode and get_current_selection() or get_register_content()
	local concat_sign = file_patterns[language].concat_sign .. " "
	local closing_output_method = file_patterns[language].closing_output_method
	local function_name = get_function_name(language)
	local line_num = vim.api.nvim_win_get_cursor(0)[1] + 1
	local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
	local file_info = ":" .. file_name .. ":" .. function_name .. ":" .. line_num .. ":"
	local data = get_printable_data(is_visual_mode, log_content, quote, concat_sign)

	local log_message = output_method
		.. "("
		.. quote
		.. plugin_prefix
		.. file_info
		.. quote
		.. concat_sign
		.. data
		.. ")"
		.. closing_output_method
	return log_message
end

local print_separator = function(space, output_method, quote)
	local dash = string.rep("-", 80)
	local sep = output_method .. "(" .. quote .. plugin_prefix .. ":" .. dash .. quote .. ")"
	vim.api.nvim_call_function("append", { vim.fn.line("."), space .. sep })
end

-- TODO:
-- Check tabstop and shiftwidth
-- Check for the existence of the kewords "function", "for", "while", "if" to fix the indentation
-- Check if the upper line is empty and if it is go to the next line above and check for the indentation
-- FIX:
-- Fix the yank function to display the correct content in order
_G.console_log_detail = function(is_visual_mode, is_wrapped)
	local language = get_language()
	if language == 0 then
		return
	end

	local output_method = file_patterns[language].output_method
	local quote = file_patterns[language].quote
	local log_message = get_log_message(is_visual_mode, language, output_method, quote)
	local space = string.rep(" ", get_previous_tab_count())
	if is_wrapped then
		print_separator(space, output_method, quote)
	end
	vim.api.nvim_call_function("append", { vim.fn.line("."), space .. log_message })
	if is_wrapped then
		print_separator(space, output_method, quote)
	end
	set_register("")
end

_G.save_current_word = function()
	local current_word = vim.fn.expand("<cword>")
	local log_content = vim.fn.getreg(register)
	log_content = log_content .. current_word .. ", "
	set_register(log_content)
end

local function get_console_patterns()
	local language = get_language()
	local quote = file_patterns[language].quote
	local output_method = file_patterns[language].output_method
	local comment_sign = file_patterns[language].comment_sign
	local escaped_comment_sign = string.gsub(comment_sign, "-", "%%-")
	local console_pattern = "^[%s]*["
		.. escaped_comment_sign
		.. "]*[%s]*"
		.. output_method
		.. "%("
		.. quote
		.. plugin_prefix
	local commented_console_pattern = "^[%s]*"
		.. escaped_comment_sign
		.. "[%s]*"
		.. output_method
		.. "%("
		.. quote
		.. plugin_prefix
	return comment_sign, console_pattern, commented_console_pattern
end

_G.delete_console_lines = function()
	local lines = {}
	local line_count = vim.api.nvim_buf_line_count(0)
	local _, console_pattern, _ = get_console_patterns()
	for i = 1, line_count do
		local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
		if not string.match(line, console_pattern) then
			table.insert(lines, line)
		end
	end
	vim.api.nvim_buf_set_lines(0, 0, line_count, false, lines)
end

local function count_indent(lines, i)
	local line = lines[i]
	if not line then
		return 0
	end
	return string.match(line, "^(%s*)") and string.len(string.match(line, "^(%s*)")) or 0
end

_G.toggle_comments = function()
	local comment_sign, console_pattern, commented_console_pattern = get_console_patterns()
	local sign_length = string.len(comment_sign) + 2
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for i, line in ipairs(lines) do
		if string.match(line, console_pattern) then
			local indent = count_indent(lines, i - 1)
			-- TODO: Refactor if else statement
			if string.match(line, commented_console_pattern) then
				line = string.gsub(line, "^%s+", "")
				lines[i] = string.rep(" ", indent) .. string.sub(line, sign_length)
			else
				line = string.gsub(line, "^%s+", "")
				lines[i] = string.rep(" ", indent) .. comment_sign .. " " .. line
			end
		end
	end
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

-- Key bindings
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "cl", ":lua console_log_detail(false, false)<CR>", opts)
keymap("v", "cl", ":lua console_log_detail(true, false)<CR>", opts)
keymap("n", "cw", ":lua console_log_detail(false, true)<CR>", opts)
keymap("v", "cw", ":lua console_log_detail(true, true)<CR>", opts)
keymap("n", "cy", ":lua save_current_word()<CR>", opts)
keymap("n", "cd", ":lua delete_console_lines()<CR>", opts)
keymap("n", "ct", ":lua toggle_comments()<CR>", opts)
