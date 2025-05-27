return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      -- Handled by nvim-dap-go
      dap.adapters.go = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
      }

      dap.adapters.lldb = {
        type = 'executable',
        command = 'lldb-vscode-14',
        name = 'lldb',
      }

      dap.configurations.rust = {
        {
          name = 'hello-world',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.getcwd() .. '/target/debug/test-rust'
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {}, -- Add any arguments if needed
          runInTerminal = false, -- Set to true if you want to run in terminal
        },
      }

      vim.keymap.set('n', '<space>ab', dap.toggle_breakpoint, { desc = '[a]nalysis add [b]reakpoint' })
      vim.keymap.set('n', '<space>aB', dap.run_to_cursor, { desc = '[a]nalysis ([B]) run to cursor' })

      require('which-key').add {
        { '<leader>a', group = '[a]nalyse (dap)' },
      }

      -- Eval var under cursor
      vim.keymap.set('n', '<space>aa', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<leader>aj', dap.continue, { desc = '[a]nalysis ([j]) continue' })
      vim.keymap.set('n', '<leader>aJ', dap.step_into, { desc = '[a]nalysis ([J]) step into' })
      vim.keymap.set('n', '<leader>al', dap.step_over, { desc = '[a]nalysis ([l]) step over' })
      vim.keymap.set('n', '<leader>aL', dap.step_out, { desc = '[a]nalysis ([L]) step out' })
      vim.keymap.set('n', '<leader>ah', dap.step_back, { desc = '[a]nalysis ([h]) step back' })
      vim.keymap.set('n', '<leader>ar', dap.restart, { desc = '[a]nalysis [r]estart' })
      vim.keymap.set('n', '<leader>aq', dap.disconnect, { desc = '[a]nalysis [q]uit' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
