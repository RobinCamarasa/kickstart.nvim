-- config
local filetypes = {
  md = 'pdf',
  tex = 'pdf',
  pdf = 'pdf',
  html = 'html',
}

-- utils
local function get_file_extension(url)
  return url:match '^.+%.(.+)$'
end

-- api
local M = {}

M.xfile = nil

function M.set_xfile(file)
  if file == nil then
    file = vim.api.nvim_buf_get_name(0)
  end
  local extension = get_file_extension(file)
  if filetypes[extension] == nil then
    M.xfile = file
    return {}
  end
  M.xfile = file:gsub('%.[^.]+$', '.' .. filetypes[extension])
  return {}
end

function M.start_xfile()
  M.set_xfile(nil)
  vim.fn.jobstart('xdg-open ' .. M.xfile)
end

function M.restart_xfile()
  M.set_xfile(M.xfile)
  vim.fn.jobstart('xdg-open ' .. M.xfile)
end

function M.pick_xfile()
  M.xfile = vim.fn.input { prompt = 'Select file to display: ' }
  M.restart_xfile()
end

-- UI
require('which-key').register {
  ['<leader>x'] = { name = '[X]dg-open', _ = 'which_key_ignore' },
}

vim.keymap.set('n', '<leader>xx', M.start_xfile, { desc = 'Open the most logical file with xdg-open' })
vim.keymap.set('n', '<leader>xX', M.restart_xfile, { desc = 'Open the last file or the most logical file with xdg-open' })
vim.keymap.set('n', '<leader>xs', M.pick_xfile, { desc = 'Set file to open with xdg-open' })

return {}
