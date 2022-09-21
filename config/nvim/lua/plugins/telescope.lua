local M = {
  "nvim-telescope/telescope.nvim", tag = '0.1.0',
  requires = { {"nvim-lua/plenary.nvim" }}
}
M.config = function()
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "__pycache__",
      }
    }
  })
end
M.keymaps = {
  {"n", "<C-p>", "<cmd>Telescope find_files<CR>"},
  {"n", "<leader>f", "<cmd>Telescope live_grep<CR>"},
}

return M


