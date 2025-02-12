return {}
--[[ return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Load lsp first
		"neovim/nvim-lspconfig",
		-- Lsp completion source
		"hrsh7th/cmp-nvim-lsp",
		-- Useful completion sources
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"onsails/lspkind.nvim",
	},
	config = function()
		local has_words_before = function()
			local cursor = vim.api.nvim_win_get_cursor(0)
			return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match("^%s$")
		end

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local compare = require("cmp.config.compare")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				-- Exit
				["<C-e>"] = cmp.mapping.abort(),
				-- Navigate documentation
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				-- Navigate entries
				["<Down>"] = cmp.mapping(
					cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					{ "i" }
				),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
				-- Select
				["<CR>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
			},
			sources = {
				-- DB
				{ name = "vim-dadbod-completion" },
				-- LSP
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				-- Lua
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				-- Math
				{ name = "calc" },
				{ name = "buffer" },
				-- Filesystem
				{ name = "path" },
				{ name = "cmdline" },
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
					col_offset = -3,
					side_padding = 0,
					winblend = vim.o.pumblend,
				},
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Pmenu,Search:None",
				}),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					return kind
				end,
			},
			sorting = {
				comparators = {
					compare.kind,
					compare.offset,
					compare.score,
					compare.exact,
					compare.recently_used,
					compare.locality,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},
		})
		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})
	end,
	enabled = false,
} ]]
