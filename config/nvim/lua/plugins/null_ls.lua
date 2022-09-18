local M = {
  "jose-elias-alvarez/null-ls.nvim"
}
M.config = function()
  local null_ls = require('null-ls')
  local null_ls_utils = require('null-ls.utils')
  null_ls.setup({
    debounce = 200,
    sources = {
      null_ls.builtins.formatting.black.with { extra_args = { "--fast" }},
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.code_actions.gitsigns,
    },
    root_dir = null_ls_utils.root_pattern(".git")
  })
end

return M
