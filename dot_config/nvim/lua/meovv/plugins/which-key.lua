return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({
      win = {
        --border = user_config.border,
        --[[ position = 'bottom', ]]
        --[[ margin = { 1, 0, 1, 0 }, ]]
        padding = { 3, 2, 3, 2 },
        --[[ winblend = 20, ]]
      },
      layout = {
        height = { min = 10, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 8,
        align = "center",
      },
    })

    wk.add({
      { "<leader>c", group = "quickfix" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "goto", icon = "" },
      { "<leader>k", group = "buffer" },
      { "<leader>j", group = "tab" },
      { "<leader>l", group = "lsp", icon = "" },
      { "<leader>lt", group = "toggle" },
      { "<leader>lw", group = "workspace" },
      { "<leader>p", group = "lazy (plugins)" },
      { "<leader>w", group = "session" },
      { "<leader>v", group = "git" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>b", group = "debugger" },
      { "<leader>t", group = "testing" },
    })
  end,
  event = "VeryLazy",
}
