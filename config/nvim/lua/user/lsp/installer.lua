-- local lsp_installer = require "nvim-lsp-installer"
-- -- 安装列表
-- -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- -- { key: 语言 value: 配置文件 }
-- local servers = {
--   sumneko_lua = require "user.lsp.lang.sumneko_lua", -- /lua/lsp/lua.lua
--   -- rust_analyzer = require "lsp.rust",
--   -- html = {},
--   jsonls = {},
--   tsserver = {},
--   pyright = {},
-- }
-- -- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end
--
--
-- lsp_installer.on_server_ready(function(server)
--   local opts = servers[server.name]
--   -- if opts then
--   --   opts.on_attach = function(_, bufnr)
--   --     local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   --     local opt = { noremap = true, silent = true }
--   --     -- rename
--   --     buf_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
--   --     -- code action
--   --     buf_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
--   --
--   --     -- go xx
--   --     buf_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
--   --     buf_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
--   --     buf_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
--   --     buf_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
--   --     buf_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
--   --     -- diagnostic
--   --     buf_keymap('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
--   --     buf_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
--   --     buf_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
--   --     -- buf_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
--   --     buf_keymap('n', '<gk>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
--   --     -- leader + =
--   --     buf_keymap('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
--   --     -- buf_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
--   --     -- buf_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
--   --     -- buf_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
--   --     -- buf_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
--   --   end
--   --   opts.flags = {
--   --     debounce_text_changes = 150,
--   --   }
--   -- end
--   server:setup(opts)
-- end)
--
-- lsp_installer.settings({
--   ui = {
--     icons = {
--       server_installed = "✓",
--       server_pending = "➜",
--       server_uninstalled = "✗"
--     }
--   }
-- })
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require "user.lsp.lang.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.lang.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require "user.lsp.lang.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "denols" then
    local denols_opts = require "user.lsp.lang.denols"
    opts = vim.tbl_deep_extend("force", denols_opts, opts)
  end

  if server.name == "tsserver" then
    local ts_opts = require "user.lsp.lang.tsserver"
    opts = vim.tbl_deep_extend("force", ts_opts, opts)
  end

  if server.name == "gopls" then
    local gopls_opts = require "user.lsp.lang.gopls"
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server.name == "solc" then
    local solc_opts = require "user.lsp.lang.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
