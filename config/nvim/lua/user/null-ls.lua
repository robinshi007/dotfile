local status_ok, nls = pcall(require, "null-ls")
if not status_ok then
  return
end

local nls_utils = require('null-ls.utils')


nls.setup({
  debounce = 150,
  sources = {
    nls.builtins.formatting.black.with { extra_args = { " --fast"}},
    nls.builtins.formatting.isort,
    nls.builtins.formatting.stylua,

    nls.builtins.code_actions.gitsigns,
  },
  root_dir = nls_utils.root_pattern(".git")
})
