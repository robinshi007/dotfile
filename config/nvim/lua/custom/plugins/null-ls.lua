local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json" } },
  -- Lua
  b.formatting.stylua,
  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- python
  b.formatting.black.with {
    extra_args = {
      "--fast",
      "--line-length=79",
    },
  },
  b.formatting.isort,

  -- rust
  b.formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- you can reuse a shared lspconfig on_attach callback here
local on_attach = function(client, bufnr)
  -- -- autoformat when saving
  -- if client.supports_method "textDocument/formatting" then
  --   vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --       vim.lsp.buf.format {
  --         bufnr = bufnr,
  --         filter = function()
  --           return client.name == "null-ls"
  --         end,
  --       }
  --     end,
  --   })
  -- end
end

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = on_attach,
}
