return {
  'tpope/vim-fugitive',
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>gc', '<CMD>Git commit<CR>', { desc = '[g]it [c]ommit' })
  end,
}
