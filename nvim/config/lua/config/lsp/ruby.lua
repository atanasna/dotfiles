local path = "/Users/atanasna/.local/share/nvim/mason/packages/ruby-lsp/"

vim.lsp.config("ruby", {
  cmd = { path .. "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = {
    "Gemfile",
  },
  settings = {},
})

vim.lsp.enable("ruby")
