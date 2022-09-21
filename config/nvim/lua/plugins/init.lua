-- [[ Plugin manager configuration file ]]
-- packer.nvim

-- automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtime = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- vim.cmd('packadd packer.nvim')
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

--- install plugins
local plugins = {
  -- edit
  require('plugins/surround'),
  require('plugins/autopairs'),
  require('plugins/comment'),
  require('plugins/align'),
  require('plugins/visual_multi'),
  require('plugins/spectre'),
  require('plugins/escape'),
  require('plugins/blankline'),
  require('plugins/illuminate'),

  -- ui
  require('plugins/theme'),
  require('plugins/statusline'),
  require('plugins/bufferline'),
  require('plugins/tree'),
  require('plugins/telescope'),
  require('plugins/gitsigns'),
  require('plugins/alpha'),
  require('plugins/treesitter'),

  -- autocomplete
  require('plugins/luasnip'),
  require('plugins/cmp'),
  require('plugins/null_ls'),
  require('plugins/lspconfig'),
  require('plugins/mason'),

  -- lanuage filetype/syntax/index
  require("plugins/lang")
}

local config = require('plugins/packer')
packer.init(config.init())
packer.startup(config.use(plugins))
-- plugin keymap
config.keymap(plugins)

-- automatically set your configuration after cloning packer.nvim
-- put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end
