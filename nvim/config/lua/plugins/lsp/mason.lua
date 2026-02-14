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
          -- "stylua", -- lua formatter
          -- "hclfmt", -- for terraform
          "luacheck", -- for lua
          -- "isort", -- python formatter
          -- "black", -- python formatter
          -- "ruff", -- python linter/formatter
          "elixir-ls",
          "jq", -- json formatter
          "yamlfmt", -- yaml formatter
          "sqlfmt", -- sql formatter
          -- Linters
          "pyright",
          -- "pylint", -- Python
          "eslint_d", -- JS
          "tflint", -- Terraform
          "phpstan", -- PHP
          "jsonlint", -- JSON
          "yamllint", -- Yaml
          -- "rubyfmt", -- Ruby
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
          -- "lua_ls", -- Lua
          -- "solargraph", -- Ruby
          -- "ruby_lsp", --Ruby
          "intelephense", -- Php
          "jsonls", -- JSON
          "yamlls", -- YAML
          "sqlls", -- SQL
          -- "pyright", -- Python
          -- "terraformls", -- Terraform
          -- "elixirls",
          "ruff", -- Python
          "zls", -- Zig
          "bashls", -- Bash
        },
        automatic_enable = {
          exclude = {
            "elixirls", -- Using custom "elixir" config instead
          },
        },
      })
    end,
  },
}
