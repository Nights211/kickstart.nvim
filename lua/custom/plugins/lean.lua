-- Lean 4 theorem prover support: LSP, infoview, and Lean-specific features
-- Configured via vim.g.lean_config (must be set before load; setup() is deprecated)
vim.g.lean_config = {
  lsp = {},
  mappings = true,
}

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/Julian/lean.nvim',
}
