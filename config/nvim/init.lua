-- neovim 0.6 windows config in lua
-- https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/plugins.lua
-- https://github.com/vitpekarek/nvim
-- refer https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f
-- https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3
--
-- https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a
-- https://randomgeekery.org/config/init.lua/

require('user.options')
require('user.plugins')
require('user.theme')
require('user.keymaps')

require('user.surround')
require('user.bufferline')
require('user.comment')
require('user.align')
require('user.which-key')
require('user.telescope')
require('user.autopairs')
require('user.colorizer')
require('user.indent-blankline')
require('user.gitsigns')
require('user.lualine')
require('user.nvim-tree')
require('user.better-escape')

require("user.cmp")
require("user.lsp")
require("user.null-ls")

require('user.au')

