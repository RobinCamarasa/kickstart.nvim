return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function()
    require('which-key').setup()
    require('which-key').register {
      ['<leader>d'] = { name = '[D]iagnostic', _ = 'which_key_ignore' },
    }
  end,
}
