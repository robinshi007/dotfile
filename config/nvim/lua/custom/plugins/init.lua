local overrides = require "custom.plugins.overrides"

return {

  -- Install a plugin
  -- ["yioneko/nvim-yati"] = {
  --   after = "nvim-treesitter",
  -- },

  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup()
    end,
  },
  ["mg979/vim-visual-multi"] = {},
  -- ["RRethy/vim-illuminate"] = {
  --   config = function()
  --     require("vim-illuminate").setup()
  --   end,
  -- },
  ["hrsh7th/cmp-cmdline"] = {
    after = "cmp-buffer",
    config = function()
      require("cmp").setup.cmdline(":", {
        sources = {
          { name = "cmdline" },
        },
      })
    end,
  },

  -- Configs
  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
