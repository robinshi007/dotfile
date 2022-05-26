local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

return {
  setup = {
    root_dir = nvim_lsp.util.root_pattern("go.mod")
  },
}
