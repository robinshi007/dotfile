local status_ok, align = pcall(require, "align")
if not status_ok then
  return
end

local map = vim.keymap
local opt = {
  noremap = true,
  silent  = true
}

map.set('x', 'aa', function() align.align_to_char(1, true)             end, opt)
map.set('x', 'as', function() align.align_to_char(2, true)             end, opt)
map.set('x', 'aw', function() align.align_to_string(false, true, true) end, opt)
map.set('x', 'ar', function() align.align_to_string(true, true, true)  end, opt)
