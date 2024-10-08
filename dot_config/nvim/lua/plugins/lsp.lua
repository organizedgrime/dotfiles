return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					-- Bash
					"bashls",
					-- Lua
					"lua_ls",
					-- Web
					"astro",
					"html",
					"cssls",
					"ts_ls",
					"eslint",
					-- C
					"clangd",
					-- OpenGL
					"glsl_analyzer",
					-- Toml
					"taplo",
					-- SQL
					"sqlls",
					-- Python
					"pylsp",
					-- Markdown / MDX
					"mdx_analyzer",
					-- LaTex
					"ltex",
					-- WGPU
					"wgsl_analyzer",
				},
			})
			local lspconfig = require("lspconfig")
			-- Bash
			lspconfig.bashls.setup({ filetypes = { "sh", "zsh" } })
			-- Lua
			lspconfig.lua_ls.setup({})
			-- Web
			lspconfig.astro.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.eslint.setup({})
			-- C
			lspconfig.clangd.setup({})
			-- OpenGL
			lspconfig.glsl_analyzer.setup({})
			-- Toml
			lspconfig.taplo.setup({})
			-- SQL
			lspconfig.sqlls.setup({})
			-- Python
			lspconfig.pylsp.setup({})
			-- Markdown
			lspconfig.mdx_analyzer.setup({
				filetypes = {
					"markdown.mdx",
					"markdown.md",
				},
			})
			-- LaTex
			lspconfig.ltex.setup({})
			-- WGPU
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = "*.wgsl",
				callback = function()
					vim.bo.filetype = "wgsl"
				end,
			})
			lspconfig.wgsl_analyzer.setup({})
		end,
	},
}
