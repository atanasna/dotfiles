----------------
--- WhichKey ---
----------------
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    local setup = {
      preset = "modern",
      plugins = {
        marks = false,
        registers = false,
      },
    }

    wk.setup(setup)
    wk.add({
      { "<leader>f", group = "Find", icon = "" },
      { "<leader>c", group = "Code", icon = "󰅱" },
      { "<leader>s", group = "Split", icon = "󰨑" },
    })
  end
}
