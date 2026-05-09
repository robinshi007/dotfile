return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      show_help = false,
      show_keys = false,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto", -- "auto", "horizon", "catppuccin"
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        exclude = {
          ".git",
          "node_modules",
          "__pycache__",
        },
      },
    },
  },
}
