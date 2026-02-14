vim.g.mapleader = " " -- set leader

-- # LSPs
require("config.lsp.elixir")
require("config.lsp.ruby")
require("config.lsp.python")
require("config.lsp.terraform")
require("config.lsp.lua")
require("config.lsp.keymaps")

-- # Lazy
require("config.lazy")
-- require("lazy").setup("plugins")
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  -- { import = "plugins.snacks" }
})
require("config.keymaps")
require("config.options")
