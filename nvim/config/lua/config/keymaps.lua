-- <C-a> - This will map Control+a key
-- <D-a> - This will map Command+a key
-- <M-a> - This will map Option+a key
--------------------------
-- Navigation
---------------------------
vim.keymap.set({"n","v"}, "<M-j>", "<Cmd>normal! 10jzz<CR>", { noremap = true, silent = true })
vim.keymap.set({"n","v"}, "<M-k>", "<Cmd>normal! 10kzz<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set({ "n", "v" }, "y", '"*y')
-- vim.keymap.set("n", "p", '"*p')

--------------------------
-- Edit
---------------------------
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "K", "k$J")
vim.keymap.set({"n", "v" }, "y", '"+y')
vim.keymap.set({"n", "v" }, "Y", '"+y$')
vim.keymap.set({"v" }, "<C-t>", ">")

-- vim.keymap.set("n", "<D-a>", "gg0vG$")
-- vim.keymap.set("n", "y", '"+y')
-- vim.keymap.set("n", "y", '"+y')
-- vim.keymap.set("n", "y", '"+y')

--
-- vim.keymap.set("n", "K", "k$J")
---------------------------
-- Splits
---------------------------
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {})
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {})
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {})
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {})
--
-- vim.api.nvim_create_user_command("SplitRight", function()
--   vim.cmd(":vertical split")
--   vim.cmd(":wincmd l")
-- end, {})
-- vim.api.nvim_create_user_command("SplitDown", function()
--   vim.cmd(":horizontal split")
--   vim.cmd(":wincmd j")
-- end, {})
--
-- vim.keymap.set("n", "<D-s>h", ":vertical split<CR>", { desc = "Split Left" })
-- vim.keymap.set("n", "<D-s>l", ":SplitRight<CR>", { desc = "Split Right" })
-- vim.keymap.set("n", "<D-s>k", ":horizontal split<CR>", { desc = "Split Up" })
-- vim.keymap.set("n", "<D-s>j", ":SplitDown<CR>", { desc = "Split Down" })
--
-- vim.keymap.set("n", "<leader>sh", ":vertical split<CR>", { desc = "Split Left" })
-- vim.keymap.set("n", "<leader>sl", ":SplitRight<CR>", { desc = "Split Right" })
-- vim.keymap.set("n", "<leader>sk", ":horizontal split<CR>", { desc = "Split Up" })
-- vim.keymap.set("n", "<leader>sj", ":SplitDown<CR>", { desc = "Split Down" })

---------------------------
-- Misc
---------------------------
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>r", ":edit!<CR>", { desc = "Reload" })
