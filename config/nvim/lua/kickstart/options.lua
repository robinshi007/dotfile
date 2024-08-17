local opt = vim.opt

-- Leader key
if vim.g.mapleader == nil then
	vim.g.mapleader = " "
	vim.g.maplocalleader = ","
	vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
end

-- Enable LazyVim auto format
-- vim.g.autoformat = true

-- General
-- stylua: ignore start
opt.clipboard:append("unnamedplus") -- Sync with system clipboard
opt.mouse      = "a" -- Enable mouse mode
opt.undofile   = true
opt.undolevels = 10000
opt.updatetime = 300 -- Save swap file and trigger CursorHold
opt.spelllang  = { "en" }
vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

-- Appearance
opt.number         = true -- Print line number
opt.showmode       = false -- Dont show mode since we have a statusline
opt.cursorline     = true -- Enable highlighting of the current line
opt.relativenumber = true -- Relative line numbers
opt.scrolloff      = 4 -- Lines of context
opt.laststatus     = 3 -- global statusline
opt.signcolumn     = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

-- Editing
local indent = 2
opt.tabstop       = indent
opt.shiftwidth    = indent -- Size of an indent
opt.expandtab     = true -- Use spaces instead of tabs
opt.smartindent   = true -- Insert indents automatically
opt.shiftround    = true -- Round indent
opt.smartcase     = true -- Don't ignore case with capitals
opt.ignorecase    = true -- Ignore case
opt.infercase     = true -- Infer letter cases for a richer built-in keyword
opt.autowrite     = true -- Enable auto write
opt.backspace     = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.wrap          = false -- Disable line wrap
opt.completeopt   = { "menu", "menuone", "noinsert" } -- customize completions
opt.virtualedit   = "block" -- Allow cursor to move where there is no text in visual block mode
opt.formatoptions = "jcroqlnt" -- tcqj
opt.confirm       = true -- Confirm to save changes before exiting modified buffer

--
-- Extra UI options
opt.pumblend       = 7 -- Popup blend
opt.pumheight      = 12 -- Maximum number of entries in a popup
opt.winminwidth    = 5 -- Minimum window width
opt.list           = false -- Show some invisible characters (tabs...
opt.listchars = {
  eol         = "↲",
  tab         = "| ",
  space       = "·",
  trail       = "¬",
  extends     = "»",
  precedes    = "«",
  nbsp        = "␣",
}
opt.conceallevel   = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.grepformat     = "%f:%l:%c:%m"
opt.grepprg        = "rg --vimgrep"
opt.inccommand     = "nosplit" -- preview incremental substitute
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.sidescrolloff  = 8 -- Columns of context
opt.splitright     = true -- Put new windows right of current
opt.splitbelow     = true -- Put new windows below current
opt.wildmode       = "longest:full,full" -- Command-line completion mode
-- opt.fillchars      = {
--   foldopen  = "",
--   foldclose = "",
--   fold      = " ",
--   foldsep   = " ",
--   diff      = "╱",
--   eob       = " ",
-- }
-- Enable syntax highlighting if it wasn't already (as it is time consuming)
if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd([[syntax enable]])
end

-- Search
opt.incsearch = true -- show search result while typing

-- Folding
vim.opt.foldlevel = 99
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'


-- Neovim Version dependent
if vim.fn.has("nvim-0.9") == 1 then
	opt.shortmess:append({ W = true, c = true, C = true }) -- reduce command line messages
	opt.splitkeep = "screen" -- reduce scroll during window split
else
	opt.shortmess:append({ W = true, c = true }) -- reduce command line messages
end
if vim.fn.has("nvim-0.10") == 1 then
	opt.termguicolors = true -- enable ui colors
	opt.smoothscroll = true
end

-- Misc
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- local snippets path
vim.g.vscode_snippets_path = "./snippets"

-- stylua: ignore end
