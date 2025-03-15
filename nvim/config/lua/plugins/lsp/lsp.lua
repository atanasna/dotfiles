return {
  "neovim/nvim-lspconfig",
  opts = {
    format = { timeout_ms = 10000 },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local servers = {
      lua_ls = {},
      solargraph = {},
      intelephense = {},
      jsonls = {},
      yamlls = {},
      sqlls = {},
      terraformls = {},
      -- pyright = {},
      ruff = {},
    }
    -- lspconfig.lua_ls.setup({})
    -- lspconfig.solargraph.setup({})
    -- lspconfig.intelephense.setup({})

    for server, config in pairs(servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    vim.keymap.set("n", "<leader>cd", vim.lsp.buf.hover, { desc = "Documentation" })
    vim.keymap.set("n", "<leader>cg", vim.lsp.buf.definition, { desc = "Go To Definition" })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {})
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {})
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {})
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {})
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", {})
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions" })
  end,
}
