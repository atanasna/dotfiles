------------
--- LSPs ---
------------
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")

      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          -- Formatters
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          -- "isort", -- python formatter
          -- "black", -- python formatter
          -- "ruff", -- python linter/formatter
          "jq", -- json formatter
          "yamlfmt", -- yaml formatter
          -- Linters
          -- "pylint", -- Python
          "eslint_d", -- JS
          "tflint", -- Terraform
          "phpstan", -- PHP
          "jsonlint", -- JSON
          "yamllint", -- Yaml
          "rubocop", -- Ruby
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "solargraph", -- Ruby
          "intelephense", -- Php
          "jsonls", -- JSON
          "yamlls", -- YAML
          -- "pyright", -- Python
          "ruff", -- Python
          "zls", -- Zig
          "bashls", -- Bash
        },
      })
    end,
  },
}
