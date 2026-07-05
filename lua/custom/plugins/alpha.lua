-- Dashboard splash screen when opening nvim/Neovide with no file.
vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/goolord/alpha-nvim',
}

require('alpha').setup(require('alpha.themes.dashboard').config)
