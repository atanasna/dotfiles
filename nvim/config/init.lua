vim.g.mapleader = " " -- set leader

-- require("config.keymaps")
-- require("config.options")
require("config.lazy")
-- require("lazy").setup("plugins")
require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })
require("config.keymaps")
require("config.options")
