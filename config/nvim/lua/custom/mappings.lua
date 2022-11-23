local M = {}

M.general = {
  n = {},
}

M.lspconfig = {
  plugin = true,

  v = {
    ["="] = {
      function()
        vim.lsp.buf.format()
      end,
      "format selected",
    },
  },

  x = {
    ["="] = {
      function()
        vim.lsp.buf.format()
      end,
      "format selected in v-line mode",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-e>"] = { "<cmd> NvimTreeToggle<CR>", "toggle nvimtree" },
  },
}

return M
