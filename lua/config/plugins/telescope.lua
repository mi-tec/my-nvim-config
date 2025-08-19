return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local builtin = require('telescope.builtin')
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')

    local open_in_new_tab = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.cmd(string.format("tabnew %s", selection.path or selection.filename))
    end

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<CR>"] = open_in_new_tab },
          n = { ["<CR>"] = open_in_new_tab },
        },
      },
    }

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set("n", "<space>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
  end
}
