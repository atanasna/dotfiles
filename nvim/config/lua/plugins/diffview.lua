return {
  'sindrets/diffview.nvim',
  config = function()
    local dv = require("diffview")

    local opts = {
      keymaps = {
        view = {
          { "n", "<esc>", "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
          { "n", "q",     "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
        },
        file_panel = {
          { "n", "<esc>", "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
          { "n", "q",     "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
        },
        file_history_panel = {
          { "n", "<esc>", "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
          { "n", "q",     "<Cmd>DiffviewClose<CR>", { desc = "Close DiffView" } },
        },
      },
    }

    dv.setup(opts)

    vim.keymap.set('n', '<leader>gh', ":DiffviewFileHistory %<CR>", { desc = "File History" })
    vim.keymap.set('n', '<leader>gr', ":DiffviewFileHistory<CR>", { desc = "Repo History" })
    vim.keymap.set('n', '<leader>gs', ":DiffviewOpen<CR>", { desc = "Status" })

    vim.keymap.set('n', '<leader>db', ":windo diffthis<CR>", { desc = "Buffers" })
    vim.keymap.set('n', '<leader>dq', ":diffoff<CR>", { desc = "Quit Diff" })

  end
}
