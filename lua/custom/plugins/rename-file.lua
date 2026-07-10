-- <leader>n: rename (or move) the file in the current buffer, in place.
-- No plugin — vim.ui.input prefilled with the current path, rename on disk,
-- rebind the buffer. Keeps undo history, marks, and cursor position.
-- Core takes the target path directly so it can be tested headless;
-- the keymap is the thin prompt wrapper. Won't overwrite an existing file.

local M = {}

--- Rename the current buffer's file to new_path (relative paths resolve
--- against nvim's cwd). An unnamed buffer is simply saved to new_path.
--- Returns true on success, nil + reason otherwise.
function M.rename_to(new_path)
  local old_path = vim.api.nvim_buf_get_name(0)
  if new_path == nil or new_path == '' then return nil, 'unchanged' end
  new_path = vim.fn.fnamemodify(new_path, ':p')
  if new_path == old_path then return nil, 'unchanged' end
  if vim.uv.fs_stat(new_path) then return nil, 'target already exists: ' .. new_path end

  vim.fn.mkdir(vim.fs.dirname(new_path), 'p')
  if old_path ~= '' then
    vim.cmd 'silent! write' -- don't lose unsaved changes in the move
    local ok, err = vim.uv.fs_rename(old_path, new_path)
    if not ok then return nil, err or 'rename failed' end
  end

  vim.api.nvim_buf_set_name(0, new_path)
  vim.cmd 'silent! write!' -- re-attach the buffer to the file on disk
  return true
end

vim.keymap.set('n', '<leader>n', function()
  local current = vim.fn.expand '%:.'
  local prompt = current == '' and 'Save as: ' or 'Rename to: '
  vim.ui.input({ prompt = prompt, default = current, completion = 'file' }, function(new_path)
    if new_path == nil then return end -- cancelled
    local ok, err = M.rename_to(new_path)
    if ok then
      vim.notify('Renamed to ' .. vim.fn.fnamemodify(new_path, ':.'))
    elseif err ~= 'unchanged' then
      vim.notify('Rename failed: ' .. err, vim.log.levels.ERROR)
    end
  end)
end, { desc = 'Re[n]ame current file' })

return M
