return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local status_ok, harpoon = pcall(require, "harpoon")
    if not status_ok then
      Snacks.notify.error("Harpoom is not working")
    end
    harpoon:setup()

    -- picker
    local function generate_harpoon_picker()
      local file_paths = {}
      for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, {
          text = item.value,
          file = item.value,
        })
      end
      return file_paths
    end
    vim.keymap.set("n", "<leader>ah", function()
      harpoon:list():add()
    end, { desc = "Add Harpoon" })
    -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>fh", function()
      Snacks.picker({
        finder = generate_harpoon_picker,
        layout = "default_A",
        title = "Hapoons",
        win = {
          input = {
            keys = {
              ["<C-d>"] = { "harpoon_delete", mode = { "i", "n", "x" } },
            },
          },
          list = {
            keys = {
              ["<C-d>"] = { "harpoon_delete", mode = { "i", "n", "x" } },
            },
          },
        },
        actions = {
          harpoon_delete = function(picker, item)
            local to_remove = item or picker:selected()
            table.remove(harpoon:list().items, to_remove.idx)
            picker:find({
              refresh = true, -- refresh picker after removing values
            })
          end,
        },
      })
    end, { desc = "Harpoons" })
  end,
}
