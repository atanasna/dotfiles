return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
        width = 1
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  init = function()
    vim.keymap.set("n", "<leader>pf", ":ZenMode<CR>", { desc = "FullScreen" })
  end
}
