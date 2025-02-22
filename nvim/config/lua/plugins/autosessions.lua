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
        -- buftypes_to_ignore = {},
        -- load_on_setup = true,
        theme_conf = {
          border = true,
          preview = false,
        },
        -- previewer = false,
        mappings = {
          delete_session = { "i", "<C-d>" },
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
    end, { desc = "Session" })

    vim.keymap.set("n", "<Leader>fs", ":SessionSearch<CR>", { desc = "Sessions"})
  end,
}
