-- Chrome-style visual tab bar. mode = 'tabs' mirrors the <C-t> tab workflow
-- (one entry per tab page) instead of listing every open buffer.
vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/akinsho/bufferline.nvim',
}

require('bufferline').setup {
  options = {
    mode = 'tabs',
    numbers = 'ordinal', -- label tabs 1. 2. 3. to match the <C-1>..<C-9> jumps
    show_close_icon = false,
  },
}
