-- check if we need to reload the file when it changed
vim.cmd [[autocmd FocusGained * checktime]]
vim.cmd [[autocmd BufNewFile,BufRead *.prisma setfiletype graphql]]
