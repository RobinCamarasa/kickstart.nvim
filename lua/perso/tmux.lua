vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '.tmuxrc',
  desc = 'Set the tmux files filetypes',
  group = vim.api.nvim_create_augroup('tmux', { clear = true }),
  command = 'set ft=sh',
})

return {}
