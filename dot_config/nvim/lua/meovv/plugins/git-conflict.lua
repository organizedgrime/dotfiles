local map = require("meovv.utils").map
return {
	"akinsho/git-conflict.nvim",
	version = "*",
	opts = {
		default_mappings = false,
		highlights = {
			incoming = "DiffText",
			current = "DiffText",
		},
	},
	init = function()
		map("n", "<leader>v[", ":GitConflictPrevConflict<cr>", { desc = "Prev conflict" })
		map("n", "<leader>v]", ":GitConflictNextConflict<cr>", { desc = "Next conflict" })
		map("n", "<leader>vo", ":GitConflictChooseOurs<cr>", { desc = "Choose ours" })
		map("n", "<leader>vt", ":GitConflictChooseTheirs<cr>", { desc = "Choose theirs" })
		map("n", "<leader>va", ":GitConflictChooseBoth<cr>", { desc = "Choose AND" })
		map("n", "<leader>v0", ":GitConflictChooseNone<cr>", { desc = "Choose none" })
	end,
	config = true,
}
