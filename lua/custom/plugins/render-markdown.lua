-- Pretty in-editor Markdown: aligned tables, styled headings, code blocks,
-- checkboxes, callouts. Renders in normal mode, reveals raw text in insert
-- mode so editing is unaffected. Icons come from mini.icons (set up in init.lua).
vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- Icons on headings but no full-width background bars (too noisy)
  heading = { backgrounds = {} },
}
