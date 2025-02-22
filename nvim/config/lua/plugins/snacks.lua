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
            height = 0.9,
          }
        }
      },
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["<leader>fg"] = "picker_grep",
              }
            }
          }
        },
      },
      matcher = { frecency = true },
      win = {
        input = {
          keys = {
            ["<c-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-n>"] = {
              function()
                Snacks.notify("test")
                local items = picker:selected({ fallback = true })
                for _, item in items do
                  Snacks.notify(item)
                end
              end,
              mode = { "i", "n" }
            }
          }
        }
      }
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
        Snacks.explorer(
          {
            layout = "select",
            auto_close = true,
            hidden = true,
          })
      end,
      desc = "Explorer"
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
              }
            }
          }
        })
      end,
      desc = "Buffers"
    },
    { "<leader>fr", function() Snacks.picker.registers() end,              desc = "Registers" },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Files" },
    { "<leader>fg", function() Snacks.picker.grep({ hidden = true }) end,  desc = "Grep" },
    {
      "<leader>fe",
      function()
        -- Get a list of all directories in the workspace
        local workspace_path = vim.fn.getcwd()
        local directories = vim.fn.systemlist("find " .. workspace_path .. " -type d")

        -- Present the directories to the user for selection
        vim.ui.select(directories, {
          prompt = "Select a directory:",
          format_item = function(item)
            return item
          end,
        }, function(choice)
          if choice then
            Snacks.picker.grep({ dirs = { choice } })
          else
            print("No directory selected")
          end
        end)
      end,
      desc = "Grep Experimental"
    },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
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
      desc = "Toggle Dim"
    },
    --{ "<leader>fp", function() Snacks.picker.projects() end,               desc = "Projects" },
    --{ "<leader>fr", function() Snacks.picker.recent() end,                 desc = "Recent" },
  }
}
