return { -- Usefull to show what has been changed since last commit
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { desc = '[g]it [p]review hunk' })
  end,
}
