return {
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
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local has_words_before = function()
			local cursor = vim.api.nvim_win_get_cursor(0)
			return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match("^%s$")
		end

		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			},
			sources = {
				{ name = "nvim_lsp", keyword_length = 3 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua", keyword_length = 2 },
				{ name = "vsnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 2 },
				{ name = "path" },
				{ name = "cmdline" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						vsnip = "⋗",
						buffer = "Ω",
						path = "🖫",
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,
}
