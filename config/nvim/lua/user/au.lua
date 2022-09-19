-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "BufEnter","FocusGained","CursorHold","CursorHoldI" },{
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- line numbers in insert mode and relative numbers in normal and visual
vim.api.nvim_create_autocmd({"InsertEnter"}, {
  command = "set norelativenumber",
  pattern = { "*"},
})
vim.api.nvim_create_autocmd({"InsertLeave"}, {
  command = "set relativenumber",
  pattern = { "*"},
})

vim.cmd [[autocmd BufNewFile,BufRead *.prisma setfiletype graphql]]
