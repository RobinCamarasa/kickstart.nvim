return {
  'stevearc/oil.nvim',
  default_file_explorer = true,
  skip_confirm_for_simple_edits = false,
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup(vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }))
  end,
}
