return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	requires = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"vale",
			},
		})
	end,
}
