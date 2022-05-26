local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
local packer_repo = string.format("https://github.com/%s", "wbthomason/packer.nvim")
local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, install_path)
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({{"Installing packer.nvim", "Type"}}, true, {})
  vim.api.nvim_command(install_cmd)
  vim.api.nvim_command "packadd packer.nvim"
else
  vim.api.nvim_command "packadd packer.nvim"
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use{  'wbthomason/packer.nvim', opt=true }

  -------------------------- plugins -------------------------------------------
  -- surround
  use "ur4ltz/surround.nvim"

  -- nvim-coloizer
  use 'norcalli/nvim-colorizer.lua'

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use "ggandor/lightspeed.nvim"
  use "mg979/vim-visual-multi"
  use "lukas-reineke/indent-blankline.nvim"
  use "RRethy/vim-illuminate"
  -- treesitter
  --use {
    --'nvim-treesitter/nvim-treesitter',
    --run = ':TSUpdate'
  --}

  -- Comment
  use 'numToStr/Comment.nvim'

  -- nvim-autopairs
  use 'windwp/nvim-autopairs'
  -- gitsign
  use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
  -- lualine
  use "hoob3rt/lualine.nvim"
  -------------------------- lsp -------------------------------------------

  -- lspconfig
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- snip
  use 'L3MON4D3/LuaSnip'
  use { 'saadparwaiz1/cmp_luasnip' }
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
  -- use 'github/copilot.vim'
  -- vsnip


  -- use 'simrat39/rust-tools.nvim'
  --------------------------- colorscheme ------------------------------------

  -- gruvbox
  use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
  }
  -- zephyr
  use 'glepnir/zephyr-nvim'
  -- nord
  use 'shaunsingh/nord.nvim'
  -- onedark
  use 'ful1e5/onedark.nvim'
  ------------------------------------
  --
  -- which-key
  use 'folke/which-key.nvim'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- use {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }

  -- lang
  use "b0o/schemastore.nvim"
  use "LunarVim/vim-solidity"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
end)
