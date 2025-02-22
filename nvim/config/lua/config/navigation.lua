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
