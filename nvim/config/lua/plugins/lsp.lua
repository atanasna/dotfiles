------------
--- LSPs ---
------------
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",      -- Lua
          "solargraph",  -- Ruby
          "intelephense" -- Php
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = { timeout_ms = 10000 }
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.solargraph.setup({})
      lspconfig.intelephense.setup({})


      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.hover, { desc = "Documentation" })
      vim.keymap.set("n", "<leader>cg", vim.lsp.buf.definition, { desc = "Go To Definition" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions" })
    end
  },
  --{
  --  "ray-x/lsp_signature.nvim",
  --  event = "VeryLazy",
  --  opts = {
  --    bind = true,
  --    handler_opts = {
  --      border = "rounded"
  --    }
  --  },
  --  config = function(_, opts)
  --    require 'lsp_signature'.setup(opts)

  --    vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = ""})
  --    --vim.keymap.set({ 'n' }, '<leader>cs', function()
  --    --  vim.lsp.buf.signature_help()
  --    --end, { silent = true, noremap = true, desc = 'Signature' })
  --  end
  --},
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "gwinn/none-ls-jsonlint.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- YAML + JSON
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.yamllint,
          require("none-ls-jsonlint.diagnostics.jsonlint"),
          -- Terraform
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.diagnostics.terraform_validate,
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.pylint,
        },
        --on_attach = function(client, bufnr)
        --  if vim.api.nvim_buf_get_name(bufnr) == "" then
        --    vim.bo[bufnr].buftype = ""
        --  end
        --end,
      })

      vim.api.nvim_create_user_command('Format', function()
        vim.lsp.buf.format({})
      end, {})
      vim.keymap.set({ "n" }, '<leader>cf', ":Format<CR>", { desc = "Format" })
    end
  }
}
