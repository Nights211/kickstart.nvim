-- Smooth scrolling for <C-d>/<C-u>/<C-f>/<C-b>/zz etc. in the terminal.
-- Disabled in Neovide, which animates scrolling natively.
if vim.g.neovide then return end

vim.pack.add { 'https://github.com/karb94/neoscroll.nvim' }

require('neoscroll').setup {}
