local path = "/Users/atanasna/.local/share/nvim/mason/packages/elixir-ls/"

vim.lsp.config("elixir", {
  cmd = { path .. "language_server.sh" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_markers = {
    "mix.exs",
  },
  settings = {
    elixirLS = {
      dialyzerEnabled = false, -- can enable later if you want
      fetchDeps = false,
    },
  }
})

vim.lsp.enable("elixir")
