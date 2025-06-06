return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  requires = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        --- Mental illnesses
        -- Prettier formatting
        "prettier",
        -- Vale for .md
        "vale",
        -- Lua
        "lua-language-server",
        -- ESLint
        "eslint-lsp",
        "eslint_d",
        -- Yaml
        "circleci-yaml-language-server",
        "gh-actions-language-server",
        "yaml-language-server",
        -- JSON
        "json-lsp",
        -- HTML
        "html-lsp",
        -- SQLlike languages
        "sqls",
        -- Debugging
        "codelldb",
        -- Typescript
        "typescript-language-server",
        -- Python
        "pyright",
        -- WGPU
        "wgsl-analyzer",
        -- #FF0 TODO
        -- Bash
        -- "bashls",
        -- LaTex
        -- "texlab",
        -- "ltex"
      },
    })
  end,
}
