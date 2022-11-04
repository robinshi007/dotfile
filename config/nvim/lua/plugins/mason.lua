local M = {}
local mason_config = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
end

local mason_lspconfig_config = function()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "cssls", "pyright", "tsserver", "gopls", "rust_analyzer", "solidity_ls"}
  })
  mason_lspconfig.setup_handlers({
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup({})
    end,
    ["rust_analyzer"] = function()
      require("rust-tools").setup({})
    end
  })
end

M.group = {
  {
    "williamboman/mason.nvim",
    config = mason_config
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = mason_lspconfig_config
  },
}

return M
