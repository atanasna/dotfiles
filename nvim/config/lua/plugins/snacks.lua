return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      prompt = "⏵ ",
      enabled = true,
      replace_netrw = true, -- Replace netrw with the snacks explorer
    },
    --indent = { enabled = true },
    input = { enabled = true },
    picker = {
      prompt = "⏵ ",
      enabled = true,
      layouts = {
        select = {
          layout = {
            height = 0.8,
            width = 0.4,
          },
        },
      },
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["<leader>fg"] = "picker_grep",
              },
            },
          },
        },
      },
      matcher = { frecency = true },
      win = {
        input = {
          keys = {
            ["<S-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<S-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-n>"] = {
              function()
                Snacks.notify("test")
                local items = picker:selected({ fallback = true })
                for _, item in items do
                  Snacks.notify(item)
                end
              end,
              mode = { "i", "n" },
            },
          },
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    terminal = { enabled = false },
    dim = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Explorer
    {
      "<leader>e",
      function()
        Snacks.explorer({
          layout = "select",
          auto_close = true,
          ignored = true,
          show_empty = true,
          hidden = true,
        })
      end,
      desc = "Explorer",
    },
    -- Find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers({
          layout = { preset = "default" },
          win = {
            input = {
              keys = {
                ["<c-d>"] = { "bufdelete", mode = { "i", "n" } },
              },
            },
          },
        })
      end,
      desc = "Buffers",
    },
    -- Find
    {
      "<leader>fr",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.smart({ hidden = true })
      end,
      desc = "Files",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.command_history({
          title = "Command History",
          layout = { preset = "select" },
        })
      end,
      desc = "Commands(History)",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.commands({
          title = "Commands",
          layout = { preset = "select" },
        })
      end,
      desc = "Commands",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.grep({ hidden = true })
      end,
      desc = "Grep",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notifications",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.lines({
          title = "Words",
          matcher = {
            fuzzy = false,
          },
          layout = {
            preset = "sidebar",
            layout = {
              position = "right",
              width = 0.35,
            },
          },
        })
      end,
      desc = "Words",
    },

    -- Git
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Status",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Branches",
    },

    -- Code
    {
      "<leader>ch",
      function()
        if Snacks.dim.enabled == true then
          Snacks.dim.disable()
        else
          Snacks.dim.enable()
        end
      end,
      desc = "Toggle Dim",
    },
    --{ "<leader>fp", function() Snacks.picker.projects() end,               desc = "Projects" },
    --{ "<leader>fr", function() Snacks.picker.recent() end,                 desc = "Recent" },
  },
}
