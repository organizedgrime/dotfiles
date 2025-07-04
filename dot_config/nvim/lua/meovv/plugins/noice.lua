local map = require("meovv.utils").map
return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
      views = {
        notify = {
          merge = true,
        },
      },
      messages = {
        -- TODO: whats
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = false,         -- enables the Noice messages UI
        view = "mini",           -- default view for messages
        view_error = "notify",   -- view for errors
        view_warn = "notify",    -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = "mini",
          opts = {},
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    })

    map("n", "<c-j>", function()
      if not require("noice.lsp").scroll(4) then
        return "<c-j>"
      end
    end)

    map("n", "<c-k>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-k>"
      end
    end)
  end,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 1000,
        fps = 60,
      },
    },
  },
}
