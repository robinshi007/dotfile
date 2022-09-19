local config = function()
  require('bufferline').setup({})
end

local keymaps = {
  {"n", "<Tab>", "<cmd>BufferLineCycleNext<CR>"},
  {"n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>"},
}

local M = {
  "akinsho/bufferline.nvim",
  requires = { "kyazdani42/nvim-web-devicons" },
  config = config,
  keymaps = keymaps,
}

return M
