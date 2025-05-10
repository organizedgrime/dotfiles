local mason_bin = require("meovv.utils.lsp").mason_bin

vim.lsp.config("pyright", {
	cmd = { mason_bin .. "pyright" },
	filetypes = {
		"python",
	},

	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
				completeFunctionParens = true,
			},
		},
	},
})

vim.lsp.enable("pyright")
