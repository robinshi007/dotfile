local map = require('core/utils').map

-- change leader to a comma
vim.g.mapleader = ','

-- map esc to jj
-- map('i', 'jj', '<Esc>')

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>')

map('n', '<leader>ev', '<cmd>e $MYVIMRC<CR>')
map('n', '<leader>sv', '<cmd>luafile $MYVIMRC<CR>')


map('v', '<', '<gv')
map('v', '>', '>gv')
