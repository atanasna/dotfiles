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
    dashboard = {
      enabled = true,
      preset = {
        header = [[
    ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
    ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
    ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  
    ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  
    ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
     ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
      ]],
      },
    },
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
            ["<D-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<D-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-n>"] = {
              -- THIS IS A TEST TO TRIGGER A NOTIFICATION ON KEYCOMBO
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
    -- Find BUFFERS
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers({
          layout = {
            preset = "default",
          },
          matcher = {
            frecency = false,
          },
          sort = {
            fields = { "#text", "idx" },
          },
        })
      end,
      desc = "Buffers",
    },
    -- FIND JUMPS
    {
      "<leader>fj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    -- Find REGISTERS
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
        Snacks.picker.files({
          hidden = true,
          ignored = true,
        })
      end,
      desc = "Files",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.command_history({
          title = "Command History",
          layout = { preset = "select" },
        })
      end,
      desc = "Commands(History)",
    },
    {
      "<leader>fC",
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
        Snacks.picker.grep({
          hidden = true,
        })
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
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Log",
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
