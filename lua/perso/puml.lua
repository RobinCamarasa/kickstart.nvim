vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*.puml',
  desc = 'Set the plantuml files filetypes',
  group = vim.api.nvim_create_augroup('puml', { clear = true }),
  command = 'set ft=puml',
})

return {}
