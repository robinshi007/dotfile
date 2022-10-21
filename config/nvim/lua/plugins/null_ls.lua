local M = {
  "jose-elias-alvarez/null-ls.nvim"
}
M.config = function()
  local null_ls = require('null-ls')
  local null_ls_utils = require('null-ls.utils')
  local b = null_ls.builtins
  null_ls.setup({
    debug = true,
    root_dir = null_ls_utils.root_pattern(".git"),
    sources = {
      -- js, ts, css, html, json
      b.formatting.prettier.with { filetypes = {"html", "css", "json", "markdown" }},

      -- python
      b.formatting.black.with { extra_args = { "--fast" }},
      -- lua
      b.formatting.stylua,
      -- git
      b.code_actions.gitsigns,
    },
    -- on_attach = function(client)
    --   if client.resolved_capabilities.document_formatting then
    --     vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    --   end
    -- end,
  })
end

M.keymaps = {
  {"n", "<leader>m", "<cmd>lua vim.lsp.buf.format()<CR>" },
  {"v", "<leader>m", "<cmd>lua vim.lsp.buf.format()<CR>" },
}

return M
