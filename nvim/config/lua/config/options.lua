vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 12
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- vim.cmd([[ highlight CursorLine guibg=#1e1e2e guifg=NONE ]])
vim.cmd("hi CursorColumn guibg=#272f3d ")
vim.cmd("hi CursorLine guibg=#272f3d ")
vim.cmd("hi CursorLineNr guifg=#ffffff gui=bold")
-- vim.cmd("hi CursorLineNr guibg=bg")

-- vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
-- vim.cmd("colorcheme gruvbox")
-- vim.cmd("hi CursorLineNr guibg=bg")
-- vim.cmd("nmap <silent> <c-k> :wincmd k<CR>")
-- vim.cmd("nmap <silent> <c-j> :wincmd j<CR>")
-- vim.cmd("nmap <silent> <c-h> :wincmd h<CR>")
-- vim.cmd("nmap <silent> <c-l> :wincmd l<CR>")
