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
      harpoon:list():add()
    end, { desc = '[h]arpoon [a]dd' })
    vim.keymap.set('n', '<leader>hq', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[h]arpoon [q]uickfix' })
    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():select(1)
    end, { desc = '[h]arpoon ([h]) access first file' })
    vim.keymap.set('n', '<leader>hj', function()
      harpoon:list():select(2)
    end, { desc = '[h]arpoon ([j]) access second file' })
    vim.keymap.set('n', '<leader>hk', function()
      harpoon:list():select(3)
    end, { desc = '[h]arpoon ([k]) access third file' })
    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():select(4)
    end, { desc = '[h]arpoon ([l]) access fourth file' })
  end,
}
