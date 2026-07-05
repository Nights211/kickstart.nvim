-- Custom plugins

return {
  -- Lean 4 theorem prover support
  -- Handles LSP, infoview, and Lean-specific features
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },
    opts = {
      lsp = {},
      mappings = true,
    },
  },

  -- Pretty in-editor Markdown: aligned tables, styled headings, code blocks,
  -- checkboxes, callouts. Renders in normal mode, reveals raw text in insert
  -- mode so editing is unaffected.
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = { 'markdown' },
    opts = {},
  },

  -- Neovide-style cursor trail in the terminal. Disabled in Neovide itself,
  -- which animates the cursor (and scrolling, see neoscroll below) natively.
  {
    'sphamba/smear-cursor.nvim',
    cond = not vim.g.neovide,
    opts = {},
  },

  -- Smooth scrolling for <C-d>/<C-u>/<C-f>/<C-b>/zz etc. in the terminal.
  {
    'karb94/neoscroll.nvim',
    cond = not vim.g.neovide,
    opts = {},
  },
}
