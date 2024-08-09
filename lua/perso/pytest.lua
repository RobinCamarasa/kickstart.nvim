local run_closest_test = function()
  local buf = vim.api.nvim_get_current_buf()
  local row, _ = vim.api.nvim_win_get_cursor(0)[1]
  local tree = vim.treesitter.get_parser(buf, 'python'):parse()[1]
  local query = vim.treesitter.query.parse('python', [[ (function_definition name: (identifier) @name (#match? @name "^test_.+$")) ]])
  local func_name = nil
  local start_row = nil
  print 'START'
  for id, node, _ in query:iter_captures(tree:root(), buf, 0, -1) do
    local name = query.captures[id]
    if name == 'name' then
      start_row, _, _, _ = node:parent():range()
      if func_name ~= nil and start_row > row - 1 then
        break
      end
      func_name = vim.treesitter.get_node_text(node, buf)
      print('FUNC: ' .. func_name)
      print('start_row: ' .. start_row)
      print('row: ' .. row)
    end
  end
  vim.cmd [[write]]
  vim.cmd([[term python -m pytest -s %::]] .. func_name)
  print(func_name)
end

require('which-key').add {
  { '<leader>t', group = '[t]est' },
}
vim.keymap.set('n', '<leader>tc', run_closest_test, { desc = '[t]est: run [c]losest' })

return {}
