return {
  {
    'ramilito/kubectl.nvim',
    config = function()
      require('kubectl').setup()
      vim.keymap.set('n', '<leader>k', '<cmd>lua require("kubectl").open()<cr>', { noremap = true, silent = true, desc = '[k]ubectl' })
    end,
  },
}
