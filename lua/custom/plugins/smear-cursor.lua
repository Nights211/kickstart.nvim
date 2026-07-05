-- Neovide-style cursor trail in the terminal. Disabled in Neovide itself,
-- which animates the cursor natively (as neoscroll.lua does for scrolling).
if vim.g.neovide then return end

vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }

require('smear_cursor').setup {}
