local M = {}

function M.get_files()
  local qflist = vim.fn.getqflist()
  local files = {}

  for _, item in ipairs(qflist) do
    local filename = item.filename
    if not filename and item.bufnr and item.bufnr > 0 then
      filename = vim.api.nvim_buf_get_name(item.bufnr)
    end

    vim.notify(filename)
    if filename and filename ~= "" then
      files[filename] = true
    end
  end

  local file_list = {}
  for file, _ in pairs(files) do
    table.insert(file_list, file)
  end

  if vim.tbl_isempty(file_list) then
    vim.notify("Quickfix list is empty or has no valid files", vim.log.levels.WARN)
    return
  end

  return file_list
  -- snacks.picker.grep({
  --   paths = file_list,
  --   regex = true, -- enable regex searching
  -- })
end

return M
-- vim.keymap.set("n", "<leader>qg", GrepQuickfixFiles, { desc = "Grep in quickfix files (regex)" })
