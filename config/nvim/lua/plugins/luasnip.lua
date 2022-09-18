return {
  'L3MON4D3/LuaSnip',
  requires = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- require('luasnip.loaders.from_lua').lazy_load()
    -- require('luasnip.loaders.from_snipmate').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load()

    require('luasnip.loaders.from_vscode').lazy_load({
      paths = {
        vim.fn.stdpath('config') .. '/snippets'
      }
    })
  end,
}
