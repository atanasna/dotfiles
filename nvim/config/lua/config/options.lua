vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.switchbuf = "useopen,usetab"

vim.opt.scrolloff = 12
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.bo.commentstring = "# %s"

-- -- Folding
-- vim.opt.foldmethod = "expr"
-- -- vim.opt.foldmethod = "syntax"
-- -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false  -- Start with folds open
-- vim.opt.foldlevel = 99       -- Open all folds by default
-- vim.opt.foldlevelstart = 99  -- Open all folds when opening a file
-- -- /Folding

-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Make cursor column and line diffierent color for visibility
-- vim.cmd([[ highlight CursorLine guibg=#1e1e2e guifg=NONE ]])
vim.cmd("hi CursorColumn guibg=#272f3d ")
vim.cmd("hi CursorLine guibg=#272f3d ")
vim.cmd("hi CursorLineNr guifg=#ffffff gui=bold")
-- vim.cmd("hi CursorLineNr guibg=bg")

-- Make yank and delete copy the content to * register so that you can paste it outside of nvim
-- vim.cmd(":set clipboard+=unnamed,unnamedplus")

-- MISC
-- vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
-- vim.cmd("colorcheme gruvbox")
-- vim.cmd("hi CursorLineNr guibg=bg")
-- vim.cmd("nmap <silent> <c-k> :wincmd k<CR>")
-- vim.cmd("nmap <silent> <c-j> :wincmd j<CR>")
-- vim.cmd("nmap <silent> <c-h> :wincmd h<CR>")
-- vim.cmd("nmap <silent> <c-l> :wincmd l<CR>")
