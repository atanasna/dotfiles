vim.g.mapleader = " " -- set leader

-- # Lazy
require("config.lazy")
-- require("lazy").setup("plugins")
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  -- { import = "plugins.snacks" }
})

-- # LSPs
require("config.lsp")
require("config.lsp.keymaps")

require("config.keymaps")
require("config.options")
require("config.filetypes")
require("config.fixes")
