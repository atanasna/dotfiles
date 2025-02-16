return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup {
      suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      cwd_change_handling = false,
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        mappings = {
          -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
          delete_session = { "i", "<C-d>" },
        },
      },
    }

    vim.keymap.set("n", "<Leader>fs", require("auto-session.session-lens").search_session, {
      noremap = true,
      desc = "Sessions"
    })
  end,
}
