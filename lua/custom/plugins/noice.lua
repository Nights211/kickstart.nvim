-- Floating cmdline + message popups + LSP progress UI (the "modern nvim" look).
-- Trial (2026-07-05): if it tips from cool into busy, delete this file.
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/noice.nvim',
}

require('noice').setup {
  lsp = {
    -- Route LSP docs/signature help through noice's nicer rendering
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  presets = {
    bottom_search = true, -- keep / search in the familiar bottom position
    command_palette = true, -- cmdline + popupmenu together, centered
    long_message_to_split = true, -- long output goes to a split, not a giant popup
  },
}
