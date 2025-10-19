vim.g.mapleader = " " -- set leader

-- require("config.keymaps")
-- require("config.options")
require("config.lsp")
require("config.lazy")
-- require("lazy").setup("plugins")
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.snacks" }
})
require("config.keymaps")
require("config.options")
