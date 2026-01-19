-- Zig-specific configuration
local M = {}

function M.setup()
  -- Set up Zig filetype detection
  vim.filetype.add({
    extension = {
      zig = 'zig',
      zir = 'zir',
    },
  })

  -- Zig-specific settings
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'zig',
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
      vim.opt_local.commentstring = '// %s'
    end,
  })

  -- Zig build integration
  vim.api.nvim_create_user_command('ZigBuild', function()
    vim.cmd('!zig build')
  end, { desc = 'Run zig build' })

  vim.api.nvim_create_user_command('ZigRun', function()
    vim.cmd('!zig build run')
  end, { desc = 'Run zig build run' })

  vim.api.nvim_create_user_command('ZigTest', function()
    vim.cmd('!zig build test')
  end, { desc = 'Run zig build test' })
end

return M
