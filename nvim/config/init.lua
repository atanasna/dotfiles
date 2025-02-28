--vim.cmd("set expandtab") -- use spaces instead of tabs
--vim.cmd("set tabstop=2") -- how many spaces a \t is
--vim.cmd("set softtabstop=2") -- how many spaces a tab button click creates
--vim.cmd("set shiftwidth=2") -- how many spaces a block indend is
vim.g.mapleader = " " -- set leader

--vim.cmd("set ssop=blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoption")
--vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 12

-- vim.cmd("nmap <silent> <c-k> :wincmd k<CR>")
-- vim.cmd("nmap <silent> <c-j> :wincmd j<CR>")
-- vim.cmd("nmap <silent> <c-h> :wincmd h<CR>")
-- vim.cmd("nmap <silent> <c-l> :wincmd l<CR>")

require("config.keymaps")
require("config.lazy")
require("lazy").setup("plugins")
