local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

return {
  setup = {
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup()
      ts_utils.setup_client(client)
    end,
  },
}
