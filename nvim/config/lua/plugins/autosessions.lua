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
          layout_config = {
            preset = "select",
            layout = {
              
              width = 0.35,
            }
            -- width = 0.4,
            -- height = 0.8,
          }
        },
        -- previewer = false,
        mappings = {
          delete_eession = { "i", "<C-d>" },
        },
      },
    }

    as.setup(opts)

    vim.keymap.set("n", "<Leader>us", function()
      Snacks.input({
        prompt = 'Session Name',
      }, function(value)
        vim.cmd("SessionSave " .. value)
      end)
    end, { desc = "Add Session" })

    vim.keymap.set("n", "<Leader>fs", ":SessionSearch<CR>", { desc = "Sessions" })
  end,
}
