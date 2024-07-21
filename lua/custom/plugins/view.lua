-- config
local filetypes = {
  md = 'pdf',
  tex = 'pdf',
  pdf = 'pdf',
}

-- api
local M = {}

M.xfile = nil

function M.set_xfile(file)
  if file == nil then
    file = vim.api.nvim_buf_get_name(0)
  end
  vim.fn.jobstart('notify-send ' .. file)
  local extension = vim.fn.expand('%:e')
  if filetypes[extension] == nil then
    M.xfile = file
    return {}
  end
  M.xfile = file:gsub('%.[^.]+$', '.' .. filetypes[extension])
  return {}
end

function M.start_xfile()
  M.set_xfile(M.xfile)
  vim.fn.jobstart('notify-send ' .. M.xfile)
  vim.fn.jobstart('xdg-open ' .. M.xfile)
end

-- TODO: implement
function M.pick_xfile()
end

-- UI
require('which-key').register {
  ['<leader>x'] = { name = '[X]dg-open', _ = 'which_key_ignore' },
}

vim.keymap.set('n', '<leader>xx', M.start_xfile, { desc = 'Open current file with xdg-open' })
vim.keymap.set('n', '<leader>xf', M.pick_xfile, { desc = 'Set file with with xdg-open' })

return {}
