return {
  'nvim-treesitter/nvim-treesitter',
  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  config = function()
    -- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        'bash',
        'vim',
        'yaml',
        'css',
        'html',
        'javascript',
        'typescript',
        'json',
        'lua',
        'python',
        'rust',
        'go',
        -- 'solidity',
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
      },
    })
    -- *Must* be *S*olidity not solidity
    -- require "nvim-treesitter.parsers".get_parser_configs().Solidity = {
    --   install_info = {
    --     url = "https://github.com/JoranHonig/tree-sitter-solidity",
    --     files = {"src/parser.c"},
    --     requires_generate_from_grammar = true,
    --   },
    --   filetype = 'solidity'
    -- }
  end,
}
