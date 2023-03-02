local M = {}

-- option
vim.opt.pumheight = 15

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "css",
    "html",
    "json",
    "javascript",
    "typescript",
    "python",
    "rust",
    "go",
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",

    -- py
    "pyright",
    "black",
    "isort",
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-v>", action = "vsplit" },
        { key = "<C-x>", action = "split" },
        { key = "R", action = "refresh" },
        { key = "-", action = "dir_up" },
        { key = "C", action = "cd" },
        { key = "P", action = "parent_node" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "I", action = "toggle_git_ignored" },
        { key = "q", action = "close" },
        { key = "E", action = "expand_all" },
        { key = "W", action = "collapse_all" },
        { key = "g?", action = "toggle_help" },
      },
    },
  },
  git = {
    enable = true,
  },

  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
