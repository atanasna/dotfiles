------------------
--- TreeSitter ---
------------------
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      vim.opt.foldenable = false
      vim.opt.foldtext = ""
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.keymap.set("n", "<Tab>", "za", { desc = "Toggle fold" })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)

          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select").select_textobject

      vim.keymap.set({ "x", "o" }, "af", function()
        select("@function.outer", "textobjects")
      end, { desc = "around function" })
      vim.keymap.set({ "x", "o" }, "if", function()
        select("@function.inner", "textobjects")
      end, { desc = "inside function" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        select("@class.outer", "textobjects")
      end, { desc = "around class" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        select("@class.inner", "textobjects")
      end, { desc = "inside class" })
      vim.keymap.set({ "x", "o" }, "aa", function()
        select("@attribute.outer", "textobjects")
      end, { desc = "around attribute" })
      vim.keymap.set({ "x", "o" }, "ia", function()
        select("@attribute.inner", "textobjects")
      end, { desc = "inside attribute" })
      vim.keymap.set({ "x", "o" }, "ai", function()
        select("@conditional.outer", "textobjects")
      end, { desc = "around conditional" })
      vim.keymap.set({ "x", "o" }, "ii", function()
        select("@conditional.inner", "textobjects")
      end, { desc = "inside conditional" })
      vim.keymap.set({ "x", "o" }, "as", function()
        select("@local.scope", "locals")
      end, { desc = "around scope" })

      vim.keymap.set("o", "iq", "i'", { desc = "inside quotes(')" })
      vim.keymap.set("o", "iQ", 'i"', { desc = 'inside quotes(")' })
      vim.keymap.set("o", "ib", "i(", { desc = "inside brackets(())" })
      vim.keymap.set("o", "iB", "i[", { desc = "inside quotes([])" })

    end,
  },
}
