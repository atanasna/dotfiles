local path = "/Users/atanasna/.local/share/nvim/mason/packages/terraform-ls/"

vim.lsp.config("terraform", {
  cmd = { path .. "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = {
    ".terraform",
  },
  settings = {},
})

vim.lsp.enable("terraform")

