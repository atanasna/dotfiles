---------------------------
-- Splits and Navigation --
---------------------------
vim.keymap.set('n', '<C-k>', ":wincmd k<CR>", {})
vim.keymap.set('n', '<C-j>', ":wincmd j<CR>", {})
vim.keymap.set('n', '<C-h>', ":wincmd h<CR>", {})
vim.keymap.set('n', '<C-l>', ":wincmd l<CR>", {})

vim.api.nvim_create_user_command('SplitRight', function()
  vim.cmd(":vertical split")
  vim.cmd(":wincmd l")
end, {})
vim.api.nvim_create_user_command('SplitDown', function()
  vim.cmd(":horizontal split")
  vim.cmd(":wincmd j")
end, {})

vim.keymap.set('n', '<leader>sl', ":vertical split<CR>", {desc = "Split Left" })
vim.keymap.set('n', '<leader>sr', ":SplitRight<CR>", {desc = "Split Right" })
vim.keymap.set('n', '<leader>su', ":horizontal split<CR>", {desc = "Split Up" })
vim.keymap.set('n', '<leader>sd', ":SplitDown<CR>", {desc = "Split Down" })
