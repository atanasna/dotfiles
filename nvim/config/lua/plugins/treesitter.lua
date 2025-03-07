------------------
--- TreeSitter ---
------------------
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter.configs")

      local opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        --   textobjects = {
        --     select = {
        --       keymaps = {
        --         -- You can use the capture groups defined in textobjects.scm
        --         ["af"] = "@function.outer",
        --         ["if"] = "@function.inner",
        --         ["ac"] = "@class.outer",
        --         -- You can optionally set descriptions to the mappings (used in the desc parameter of
        --         -- nvim_buf_set_keymap) which plugins like which-key display
        --         ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        --         -- You can also use captures from other query groups like `locals.scm`
        --         ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        --       },
        --     }
        --   }
      }

      ts.setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local tso = require("nvim-treesitter.configs")

      local opts = {
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              -- functionons
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- classes
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              -- attributes
              ["aa"] = "@attribute.outer",
              ["ia"] = "@attribute.inner",
              -- conditions
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
          },
        },
      }

      tso.setup(opts)

      vim.keymap.set("o", "iq", "i'", { desc = "inside quotes(')" })
      vim.keymap.set("o", "iQ", 'i"', { desc = 'inside quotes(")' })
      vim.keymap.set("o", "ib", "i(", { desc = "inside brackets(())" })
      vim.keymap.set("o", "iB", "i[", { desc = "inside quotes([])" })
    end,
  },
}
