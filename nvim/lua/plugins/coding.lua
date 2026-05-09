return {
  {
    "mg979/vim-visual-multi",
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      show_help = false,
      show_keys = false,
    },
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "python",
  --     },
  --   },
  -- },

  -- add any tools you want to have installed below
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "ruff",
  --       "pyright",
  --       "isort",
  --       "gopls",
  --     },
  --   },
  -- },
}
