-- Adds a home screen dashboard
return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					[[                                  _           ]],
					[[  /\/\   ___  _____      __/\   /(_)_ __ ___  ]],
					[[ /    \ / _ \/ _ \ \ /\ / /\ \ / / | "_ ` _ \ ]],
					[[/ /\/\ \  __/ (_) \ V  V /  \ V /| | | | | | |]],
					[[\/    \/\___|\___/ \_/\_/    \_/ |_|_| |_| |_|]],
				},
				disable_move = { false },
				shortcut = {},
				packages = { false },
				project = { enable = true, limit = 3, action = "Oil" },
				mru = { limit = 4 },
				footer = {},
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
