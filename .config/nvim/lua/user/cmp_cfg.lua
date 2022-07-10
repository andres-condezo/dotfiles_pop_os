local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init()

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<A-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<A-o>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<A-y>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        luasnip = "[LuaSnip]",
        -- vsnip = "[VSnip]",
        -- snippy = "[SSnip]",
        ultisnips = "[UltiSnip]",
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LuaAPI]",
        cmp_tabnine = "[TabNine]",
        path = "[Path]",
				emoji = "[emoji]",
				npm = "[npm]",
      },
    },
  },

	sources = {
		{ name = "luasnip" },
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "path" },
    { name = 'emoji' },
		{ name = 'npm', keyword_length = 4 },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),

		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		col_offset = -3,
		side_padding = 100,
	},
	experimental = {
		ghost_text = true,
	},
	-- view = {
	-- 	entries = "native",
	-- },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- nvim-cmp highlight groups.
vim.cmd [[
	highlight!      CmpItemMenu       guibg=NONE guifg=grey
]]

require'luasnip'.filetype_extend("ruby", {"rails"})
require'luasnip'.filetype_extend("python", {"django"})
require'luasnip'.filetype_extend("javascript", {"vue"})
vim.cmd 'let g:UltiSnipsExpandTrigger="<C-A>x"'
