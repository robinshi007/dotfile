
return {
  'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('nvim-tree').setup({
      open_on_setup = true,
      sort_by = "name",
      --   open_on_tab = true,
      view = {
        adaptive_size = true,
        width = 32,
        height = 40,
        side = "left",
      },
      renderer = {
        icons = {
          show = {
            folder = true,
            folder_arrow = true,
            file = false,
            git = true,
          }
        }
      }

    })
  end,
  keymaps = {
    {'n', '<C-n>', '<cmd>NvimTreeToggle<CR>'},
    {'n', '<C-e>', '<cmd>NvimTreeToggle<CR>'},
    {'n', '<leader>e', '<cmd>NvimTreeFocus<CR>'},
  },
}

