local M = {}
local merge_tb = vim.tbl_deep_extend

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = merge_tb('force', options, ops)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.mapset = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = merge_tb('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end


return M
