local status_ok, align = pcall(require, 'align')
if not status_ok then
  return {}
end

local M = {
  "Vonr/align.nvim"
}

M.config = function()
end

M.keymaps = {
  {'x', 'aa', function() align.align_to_char(1, true) end },
  {'x', 'as', function() align.align_to_char(2, true) end },
}

return M

