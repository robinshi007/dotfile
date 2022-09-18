-- [[ General neovim settings ]]

local g = vim.g      -- global variables
local opt = vim.opt  -- set options(global/buffer/window-scoped)

----------------
-- General
----------------
opt.mouse = 'a'                                 -- enable mouse support
opt.clipboard = 'unnamedplus'                    -- copy/paste to systom clipboard
opt.swapfile = false                            -- disable swap file
opt.completeopt = 'menuone,noinsert,noselect'   -- autocomplete options
opt.autoread = true

----------------
-- UI
----------------
opt.number     = true
opt.showmatch  = true
opt.foldmethod = 'marker'
opt.colorcolumn = '80'
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase   = true
opt.linebreak = true
opt.termguicolors = true
opt.laststatus = 3

----------------
-- Tabs, indent
----------------
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

----------------
-- Memory, CPU
----------------
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 700     -- ms to wait for trigger an event

----------------
-- Startup
----------------
opt.shortmess:append "sI"
vim.o.signcolumn = "yes"
vim.o.pumheight = 15

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
