-----------------
--- Telescope ---
-----------------
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep Files" }) -- YOU NEED TO HAVE RIPGREP <brew install ripgrep>
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "Registers" })
      vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = "Marks" })

      -- This Section allows for searching and deleting buffers
      -- The snipped is taken from this page: https://medium.com/@jogarcia/delete-buffers-on-telescope-21cc4cf61b63
      -- Keys:
      -- leader-fb - to open buffer search
      -- dd - to delete a highlighted buffer
      -- Tab - to select buffer(multiples)
      -- C-d - to delete all selected buffers
      local builtin = require('telescope.builtin')
      local action_state = require('telescope.actions.state')
      local actions = require('telescope.actions')
      buffer_searcher = function()
        builtin.buffers {
          sort_mru = true,
          ignore_current_buffer = false,
          show_all_buffers = true,
          attach_mappings = function(prompt_bufnr, map)
            local refresh_buffer_searcher = function()
              actions.close(prompt_bufnr)
              vim.schedule(buffer_searcher)
            end

            local delete_buffers = function()
              local picker = action_state.get_current_picker(prompt_bufnr)
              local selection = picker:get_multi_selection()
              if (#selection > 0) then
                for _, entry in ipairs(selection) do
                  vim.api.nvim_buf_delete(entry.bufnr, { force = true })
                end
              else
                local single_selection = action_state.get_selected_entry()
                vim.api.nvim_buf_delete(single_selection.bufnr, { force = true })
              end
              refresh_buffer_searcher()
            end

            map('i', '<C-d>', delete_buffers)

            return true
          end
        }
      end

      vim.keymap.set('n', '<leader>fb', buffer_searcher, { desc = "Buffers" })
      --require("telescope").setup {
      --  defaults = {
      --    mappings = {
      --      i = {
      --        ["<C-q>"] = actions.close
      --      },
      --    },
      --  }
      --}
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }

}
