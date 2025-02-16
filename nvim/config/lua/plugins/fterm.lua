-------------
--- FTerm ---
-------------
return {
  "numToStr/FTerm.nvim",
  config = function()
    require 'FTerm'.setup({
      border     = 'double',
      dimensions = {
        height = 0.8,
        width = 0.8,
      },
    })

    -- Example keybindings
    vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").open()<CR>', {desc="Open Terminal"})
    vim.keymap.set('n', '<esc>', '<CMD>lua require("FTerm").close()<CR>', {desc="Close Terminal"})
    vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n><CMD>q<CR>', {desc="Close Terminal App"})
  end
}
