return { -- Usefull to show what has been changed since last commit
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { desc = '[g]it [p]review hunk' })
    vim.keymap.set('n', '<leader>gs', require('gitsigns').stage_hunk, { desc = '[g]it [s]tage hunk' })
    vim.keymap.set('n', '<leader>gu', require('gitsigns').undo_stage_hunk, { desc = '[g]it [u]ndo stage hunk' })
  end,
}
