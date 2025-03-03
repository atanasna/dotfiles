return {
  'sindrets/diffview.nvim',
  config = function()
    local dv = require("diffview")

    local opts = {}

    dv.setup(opts)

    vim.keymap.set('n', '<leader>gf', ":DiffviewFileHistory %<CR>", { desc = "File History" })
    vim.keymap.set('n', '<leader>gr', ":DiffviewFileHistory<CR>", { desc = "Repo History" })
    vim.keymap.set('n', '<leader>gq', ":DiffviewClose<CR>", { desc = "Close DiffView" })
  end
}
