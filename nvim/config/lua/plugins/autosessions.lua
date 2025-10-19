return {
  "rmagatti/auto-session",
  config = function()
    local as = require("auto-session")
    local opts = {
      suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_save = true,
      auto_create = false,
      cwd_change_handling = false,
      session_lens = {
        picker_opts = {
          preset = "select"
        },
        mappings = {
          delete_eession = { "i", "<C-x>" },
        },
      },
    }

    as.setup(opts)

    vim.keymap.set("n", "<Leader>as", function()
      Snacks.input({
        prompt = 'Session Name',
      }, function(value)
        vim.cmd("SessionSave " .. value)
      end)
    end, { desc = "Add Session" })

    vim.keymap.set("n", "<Leader>fs", ":AutoSession search<CR>", { desc = "Sessions" })
  end,
}
