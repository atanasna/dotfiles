---------------
--- NeoTree ---
---------------
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree float reveal toggle<cr>", desc = "Open File Explorer" },
  }
}
--return {
--  "nvim-tree/nvim-tree.lua",
--  version = "*",
--  lazy = false,
--  dependencies = {
--    "nvim-tree/nvim-web-devicons",
--  },
--  config = function()
--    local gheight = vim.api.nvim_list_uis()[1].height
--    local gwidth = vim.api.nvim_list_uis()[1].width
--    local width = 120
--    local height = 40
--
--    require("nvim-tree").setup {
--      view = {
--        float = {
--          enable = true,
--          open_win_config = {
--            relative = "editor",
--            width = width,
--            height = height,
--            row = (gheight - height) * 0.5,
--            col = (gwidth - width) * 0.5,
--          }
--        },
--      }
--    }
--
--    vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", { desc = "Toggle Folder Tree" })
--    vim.keymap.set('n', '<esc>', ":NvimTreeClose<CR>", { desc = "Toggle Folder Tree" })
--    vim.keymap.set('n', '.', 'api.tree.change_root_to_node()', { desc = "Toggle Folder Tree" })
--  end,
--}
