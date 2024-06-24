return {
  'nvim-telescope/telescope-symbols.nvim',
  config = function()
    vim.keymap.set('n', '<leader>se', '<CMD>Telescope symbols<CR>', { desc = '[s]earch [e]moji' })
  end,
}
