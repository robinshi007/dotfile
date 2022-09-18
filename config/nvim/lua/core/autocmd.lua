local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Set indentation to 2 space
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- autorelead with file changed
autocmd({ "BufEnter","FocusGained","CursorHold","CursorHoldI" },{
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- line numbers in insert mode and relative numbers in normal and visual
autocmd({"InsertEnter"}, {
  command = "set norelativenumber",
  pattern = { "*"},
}) 
autocmd({"InsertLeave"}, {
  command = "set relativenumber",
  pattern = { "*"},
})
