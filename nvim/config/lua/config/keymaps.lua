--------------------------
-- Navigation
---------------------------
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<Cmd>normal! 30jzz<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<Cmd>normal! 30kzz<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "y", "\"*y")
vim.keymap.set("n", "p", "\"*p")

---------------------------
-- Splits 
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


---------------------------
-- Misc 
---------------------------
vim.keymap.set('n', '<leader>q', ":q<CR>", {desc = "Quit" })
