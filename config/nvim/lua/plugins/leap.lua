local M = {}

M.group = {
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').setup({})
    end,
    keymaps = {
      {"n", "s", "<Plug>(leap-forward)"},
      {"n", "S", "<Plug>(leap-backward)"},
      {"x", "s", "<Plug>(leap-forward)"},
      {"x", "S", "<Plug>(leap-backward)"},
      {"o", "z", "<Plug>(leap-forward)"},
      {"o", "Z", "<Plug>(leap-backward)"},
      {"o", "x", "<Plug>(leap-forward-x)"},
      {"o", "X", "<Plug>(leap-backward-x)"},
      {"n", "gs", "<Plug>(leap-cross-window)"},
      {"x", "gs", "<Plug>(leap-cross-window)"},
      {"o", "gs", "<Plug>(leap-cross-window)"},
    },
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require('flit').setup({
        labeled_modes = 'nv',
      })
    end
  }
}


return M
