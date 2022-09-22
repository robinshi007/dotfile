
return {
  'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('nvim-tree').setup({
      open_on_setup = true,
      sort_by       = "name",
      --   open_on_tab = true,
      view = {
        width         = 32,
        height        = 30,
        side          = "left",
        mappings = {
          custom_only = true,
          list = {
            { key = {"<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
            { key = "<C-v>",  action = "vsplit" },
            { key = "<C-x>",  action = "split" },
            { key = "R",  action = "refresh" },
            { key = "-",  action = "dir_up" },
            { key = "C",  action = "cd" },
            { key = "P",  action = "parent_node" },
            { key = "a",  action = "create" },
            { key = "d",  action = "remove" },
            { key = "r",  action = "rename" },
            { key = "y",  action = "copy_name" },
            { key = "Y",  action = "copy_path" },
            { key = "gy", action = "copy_absolute_path" },
            { key = "H",  action = "toggle_dotfiles" },
            { key = "q",  action = "close" },
            { key = "E",  action = "expand_all" },
            { key = "W",  action = "collapse_all" },
            { key = "g?", action = "toggle_help" },
          },
        }
      },
      renderer = {
        icons = {
          show = {
            folder       = true,
            folder_arrow = true,
            file         = false,
            git          = true,
          }
        }
      },
      filters = {
        dotfiles = true
      },
      actions = {
        open_file = {
          quit_on_open = true,
        }
      }

    })
  end,
  keymaps = {
    {'n', '<C-e>', '<cmd>NvimTreeToggle<CR>'},
    {'n', '<leader>e', '<cmd>NvimTreeFocus<CR>'},
  },
}

