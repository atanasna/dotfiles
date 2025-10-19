vim.lsp.enable({
  "pyright",
  "ruby_lsp",
  "lua_ls",
})
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Show Documentation" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Show Definition" })
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show Error/Diagnostic" })
vim.keymap.set("n", "<leader>cI", ":LangInfo<cr>", { desc = "Show LSP/Linter/Formatter Info" })

-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {})
-- vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "Show diagnostic" })
-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {})
-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {})
-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {})
-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
-- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", {})
-- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions" })


-- Show Information LSP/Formatter/Linter active on the current buffer
vim.api.nvim_create_user_command("LangInfo", function()
  local ft = vim.bo.filetype
  local buf = vim.api.nvim_create_buf(false, true)
  local ns = vim.api.nvim_create_namespace("langinfo")
  local line_num = 0

  local function add_line(text, hl_group, hl_start, hl_end)
    vim.api.nvim_buf_set_lines(buf, line_num, line_num, false, { text })
    if hl_group then
      vim.api.nvim_buf_add_highlight(buf, ns, hl_group, line_num, hl_start, hl_end)
    end
    line_num = line_num + 1
  end

  local function add_status_item(name, available)
    local symbol = available and "✓" or "✗"
    local hl = available and "DiagnosticOk" or "DiagnosticError"
    add_line("  " .. symbol .. " " .. name, hl, 2, 3)
  end

  add_line("Language: " .. ft)
  add_line("")

  -- LSP Servers
  add_line("LSP Servers:")
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    for _, client in ipairs(clients) do
      add_status_item(client.name, true)
    end
  else
    add_line("  (none)")
  end
  add_line("")

  -- Linters
  add_line("Linters:")
  local linters = require("lint").linters_by_ft[ft]
  if linters and #linters > 0 then
    for _, linter in ipairs(linters) do
      local linter_config = require("lint").linters[linter]
      local cmd = linter_config and linter_config.cmd or linter
      local available = vim.fn.executable(cmd) == 1
      add_status_item(linter, available)
    end
  else
    add_line("  (none)")
  end
  add_line("")

  -- Formatters
  add_line("Formatters:")
  local formatters = require("conform").list_formatters(0)
  if #formatters > 0 then
    for _, formatter in ipairs(formatters) do
      add_status_item(formatter.name, formatter.available)
    end
  else
    add_line("  (none)")
  end

  add_line("")
  add_line("Logs:")
  add_line("  LSP:    :lua vim.cmd.edit(vim.lsp.get_log_path())")
  add_line("  Conform: tail -f ~/.local/state/nvim/conform.log")
  add_line("  Lint:   (uses vim.diagnostic)")

  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  local height = line_num + 2
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = 60,
    height = height,
    col = (vim.o.columns - 60) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
    title = " Language Info ",
    title_pos = "center",
  })

  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
end, {})
