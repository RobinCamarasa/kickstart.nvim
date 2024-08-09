return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    require('which-key').add {
      { '<leader>h', group = '[h]arpoon' },
    }
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():append()
    end, { desc = '[h]arpoon [a]dd' })
    vim.keymap.set('n', '<leader>hq', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[h]arpoon [q]uickfix' })
  end,
}
