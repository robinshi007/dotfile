local map = require('core/utils').map

-- change leader to a comma
vim.g.mapleader = ','

-- map esc to jj
-- map('i', 'jj', '<Esc>')

-- H to move the first non-blank char
map('n', 'H', '^')

-- clear search highlighting
map('n', '<CR>', ':nohl<CR>')

map('n', '<leader>ev', '<cmd>e $MYVIMRC<CR>')
map('n', '<leader>sv', '<cmd>luafile $MYVIMRC<CR>')

-- keep visual mode indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- save file by CTRL+S
map('n', '<C-s>', '<cmd>w<CR>')
map('i', '<C-s>', '<ESC> <cmd>w<CR>')

-- buffer
map('n', '<S-q>', ':bd<CR>')


