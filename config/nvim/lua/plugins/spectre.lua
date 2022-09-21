local M = {
  "nvim-pack/nvim-spectre"
}

M.config = function()
  require('spectre').setup()
end

M.keymaps = {
  {"n", "<leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"},
  {"v", "<leader>pr", "<cmd>lua require('spectre').open_visual({})<CR>"},
  {"n", "<leader>R", "<cmd>lua require('spectre.actions').run_replace()<CR>"},
  {"v", "<leader>v", "<cmd>lua require('spectre').change_view()<CR>"},
}

return M
