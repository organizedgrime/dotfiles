return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = {
    "markdown",
    "octo",
  },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true }, blink = { enabled = true } },
    file_types = { "markdown", "octo" },
  },
  config = function()
    require("render-markdown").setup()
  end,
}
