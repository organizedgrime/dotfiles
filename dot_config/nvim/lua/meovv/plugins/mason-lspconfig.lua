return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		local user_config = require("meovv.core.user")
		require("mason").setup({
			ui = {
				border = user_config.border,
			},
		})

		local u = require("meovv.utils")
		local default_config = require("meovv.lsp.servers.defaults")
		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup({
			ensure_installed = user_config.lsp.ensure_installed,
			handlers = {
				function(server) -- default handler (optional)
					local server_config = default_config

					-- set up default meovv options
					local ok, meovv_server_config = pcall(require, "meovv.lsp.servers." .. server)
					if ok then
						server_config = u.merge(server_config, meovv_server_config)
					end
					-- override options if user defines them
					if
						type(user_config.lsp.servers[server]) == "table"
						and user_config.lsp.servers[server].opts ~= nil
					then
						server_config = u.merge(server_config, user_config.lsp.servers[server].opts)
					end
					lspconfig[server].setup(server_config)
				end,
			},
		})

		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint",
			},
			automaticinstallation = false,
			handlers = {},
		})
	end,
	dependencies = {
		"williamboman/mason.nvim",
		"folke/noice.nvim",
		{
			"jay-babu/mason-null-ls.nvim",
			requires = { "nvimtools/none-ls.nvim" },
		},
	},
	event = { "BufEnter", "CmdlineEnter" },
}
