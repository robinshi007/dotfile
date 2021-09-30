-- neovim 0.5 windows config in lua
-- https://github.com/vitpekarek/nvim
-- refer https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f
-- https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3

-- section [keymap, options, util, mappings, statusline]
-- Re-map vim objects
local cmd = vim.cmd -- to execute vim commands e.g. cmd('pwd')
local fn = vim.fn -- call vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local api = vim.api -- to set api
local execute = vim.api.nvim_command
-- local editor_root = vim.fn.expand("~/.config/nvim/")

-- helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end
local function file_exists(name)
  local fi = io.open(name, "r")
  if fi ~= nil then
    io.close(fi)
    return true
  else
    return false
  end
end

-- Plugins
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  api.nvim_echo({{"Installing packer.nvim", "Type"}}, true, {})
  fn.system({"git", "clone", "--depth", "-1", "https://github.com/wbthomason/packer.nvim " , install_path})
  cmd "packadd packer.nvim"
end
api.nvim_exec([[
augroup Packer
autocmd!
autocmd! BufWritePost init.lua PackerCompile
augroup end
]], false)

require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    -- use common
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "windwp/nvim-autopairs"
    use "b3nj5m1n/kommentary"
    use "ggandor/lightspeed.nvim"
    use "mg979/vim-visual-multi"
    use "rmagatti/auto-session"
    -- use "nvim-treesitter/nvim-treesitter"
    -- ui
    use "winston0410/cmd-parser.nvim"
    use "winston0410/range-highlight.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/nvim-bufferline.lua"
    use "hoob3rt/lualine.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "sainnhe/edge"
    use "RRethy/vim-illuminate"
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    -- lsp
    use {"neovim/nvim-lspconfig"}
    use "kabouzeid/nvim-lspinstall"
    use "onsails/lspkind-nvim"
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "mhartington/formatter.nvim"
    -- use "jose-elias-alvarez/nvim-lsp-ts-utils"
    -- lang
    use "tomlion/vim-solidity"
  end
)

-- Colourscheme config
opt.background = "dark" -- dark or light
opt.termguicolors = true
g.edge_style = "aura"
g.edge_enable_italic = 1
g.edge_disable_italic_comment = 1
cmd([[colorscheme edge]])

opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.spelllang = "en"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noselect"
opt.cursorline = false
opt.foldenable = false -- fold
opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
opt.linebreak = true -- Stop words being broken on wrap
opt.numberwidth = 5 -- Make the gutter wider by default
opt.scrolloff = 4 -- Lines of context
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
vim.wo.signcolumn = "yes" -- always show signcolumns
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.backspace = {"indent", "eol", "start"}
vim.wo.number = true -- Show line numbers
vim.wo.list = true -- Show some invisible characters
opt.listchars = "tab:>·,space:·,nbsp:␣,trail:~,eol:¶,precedes:«,extends:»"
opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.wrap = true

vim.g.netrw_liststyle = 3 -- Tree style Netrw

-- Map leader to space
g.mapleader = ","

-- Lightspeed remap {{{
require("lightspeed").setup(
  {
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = false,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5
  }
)
map("n", "<expr> f", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"')
map("n", "<expr> F", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"')
map("v", "<expr> v", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"')
map("v", "<expr> F", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"')
--[[ nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T" ]]
function repeat_ft(reverse)
  local ls = require "lightspeed"
  ls.ft["instant-repeat?"] = true
  ls.ft:to(reverse, ls.ft["prev-t-like?"])
end
map("n", ";", "<cmd>lua repeat_ft(false)<cr>")
map("x", ";", "<cmd>lua repeat_ft(false)<cr>")
map("n", ",", "<cmd>lua repeat_ft(true)<cr>")
map("x", ",", "<cmd>lua repeat_ft(true)<cr>")
---}}}

-- ===== KEYMAPPINGS ===== {{{
-- Open nvimrc file
map("n", "<Leader>ev", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile $MYVIMRC<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>")
map("n", "<c-k>", "<cmd>m .-2<CR>")

-- Simpler increment/decrement integers
map("n", "+", "<C-a>")
map("v", "+", "<C-a>")
map("n", "-", "<C-x>")
map("v", "-", "<C-x>")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>")

map("n", "<leader>d", ":%bd|e#|bd#<CR>")

-- }}}

-- Highlight on yank
vim.api.nvim_exec(
  [[
augroup YankHighlight
 autocmd!
 autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup end
]],
  false
)

-- PLugins
-- Plugin setup
require("range-highlight").setup({})
require("nvim-autopairs").setup(
  {
    fast_wrap = {},
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
  }
)
require("kommentary.config").configure_language(
  "default",
  {
    prefer_single_line_comments = true
  }
)
require("nvim-autopairs.completion.compe").setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = false -- auto select first item
  }
)
require("nvim-web-devicons").setup({})
require("bufferline").setup({})
require("lualine").setup(
  {
    options = {
      icons_enabled = true,
      theme = "onedark",
      component_separators = {" ", " "},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {"mode", "paste"},
      lualine_b = {
        {"branch", icon = ""},
        {"diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666"}
      },
      lualine_c = {
        {"diagnostics", sources = {"nvim_lsp"}},
        function()
          return "%="
        end,
        "filename"
      },
      lualine_x = {"filetype"},
      lualine_y = {
        {
          "progress"
        }
      },
      lualine_z = {
        {
          "location",
          icon = ""
        }
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
)
require("indent_blankline").setup(
  {
    char = "|",
    filetype_exclude = {"help"},
    buftype_exclude = {"terminal", "nofile"}
  }
)

require("gitsigns").setup(
  {
    numhl = true,
    signcolumn = false,
    signs = {
      add = {hl = "GitGutterAdd", text = "+"},
      change = {hl = "GitGutterChange", text = "~"},
      delete = {hl = "GitGutterDelete", text = "_"},
      topdelete = {hl = "GitGutterDelete", text = "‾"},
      changedelete = {hl = "GitGutterChange", text = "~"}
    }
  }
)
require("lspkind").init({})
-- session
require("auto-session").setup(
  {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_restore_suppress_dirs = nil
  }
)
-- nvim-tree {{{
require("nvim-tree.events").on_nvim_tree_ready(
  function()
    vim.cmd("NvimTreeRefresh")
  end
)
g.nvim_tree_follow = 1
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_quit_on_open = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  }
}

-- explorer
map("n", "<c-e>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
-- map("n", "<Leader>r", ":NvimTreeRefresh<CR>")
--}}}

-- Telescope {{{
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
require("telescope").setup(
  {
    defaults = {
      winblend = 20,
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
      }
    },
    pickers = {
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<C-w>"] = "delete_buffer"
          },
          n = {
            ["<C-w>"] = "delete_buffer"
          }
        }
      },
      -- https://gitter.im/nvim-telescope/community?at=6113b874025d436054c468e6 Fabian David Schmidt
      find_files = {
        on_input_filter_cb = function(prompt)
          local find_colon = string.find(prompt, ":")
          if find_colon then
            local ret = string.sub(prompt, 1, find_colon - 1)
            vim.schedule(
              function()
                local prompt_bufnr = vim.api.nvim_get_current_buf()
                local picker = action_state.get_current_picker(prompt_bufnr)
                local lnum = tonumber(prompt:sub(find_colon + 1))
                if type(lnum) == "number" then
                  local win = picker.previewer.state.winid
                  local bufnr = picker.previewer.state.bufnr
                  local line_count = vim.api.nvim_buf_line_count(bufnr)
                  vim.api.nvim_win_set_cursor(win, {math.max(1, math.min(lnum, line_count)), 0})
                end
              end
            )
            return {prompt = ret}
          end
        end,
        attach_mappings = function()
          actions.select_default:enhance(
            {
              post = function()
                -- if we found something, go to line
                local prompt = action_state.get_current_line()
                local find_colon = string.find(prompt, ":")
                if find_colon then
                  local lnum = tonumber(prompt:sub(find_colon + 1))
                  vim.api.nvim_win_set_cursor(0, {lnum, 0})
                end
              end
            }
          )
          return true
        end
      }
    }
  }
)
map("n", "<c-p>", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<cr>')
map(
  "n",
  "<leader>g",
  '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<cr>')
map(
  "n",
  "<leader>f",
  '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes").get_dropdown({}))<cr>'
)
map(
  "n",
  "<leader>i",
  '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes").get_dropdown({}))<cr>'
)
-- map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
-- map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
-- map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
-- }}}

---}}}
--- tree-sitter {{{
-- local ts = require("nvim-treesitter.configs")
-- ts.setup({ensure_installed = "maintained", highlight = {enable = true}})
---}}}

-- LSP {{{
-- for LSP completion with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20
    },
    -- Disable a feature
    update_in_insert = false
  }
)

local enhance_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
  end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- -- Mappings.
  -- local opts = { noremap=true, silent=true }

  -- -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lspconfig = require("lspconfig")
lspconfig["tsserver"].setup(
  {
    on_attach = function(client, bufnr)
      filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
      cmd = {"typescript-language-server.cmd", "--stdio"}
      client.resolved_capabilities.document_formatting = false
      enhance_attach(client)
    end
  }
)
lspconfig["pyright"].setup(
  {
    on_attach = enhance_attach
  }
)
lspconfig["rust_analyzer"].setup(
  {
    capabilities = capabilities
  }
)
lspconfig["gopls"].setup(
  {
    cmd = {"gopls", "--remote=auto"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    init_options = {
      usePlaceholders = true,
      completeUnimported = true
    }
  }
)
-- }}}
-- LSP saga {{{
local saga = require("lspsaga")
saga.init_lsp_saga(
  {
    code_action_icon = " ",
    definition_preview_icon = "  ",
    dianostic_header_icon = "   ",
    error_sign = " ",
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    hint_sign = "⚡",
    infor_sign = "",
    warn_sign = ""
  }
)

map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", {silent = true})
map("n", "<leader>ca", ":Lspsaga code_action<CR>", {silent = true})
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {silent = true})
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", {silent = true})
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {silent = true})
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {silent = true})
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", {silent = true})
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", {silent = true})
map("n", "<leader>cr", ":Lspsaga rename<CR>", {silent = true})
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", {silent = true})
-- }}}

-- vsnip {{{
g.vsnip_snippet_dir = fn.stdpath("config") .. "/snippets"
-- }}}

-- Compe {{{
require("compe").setup(
  {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 2,
    preselect = "disable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    documentation = {
      border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1
    },
    source = {
      path = true,
      calc = true,
      buffer = true,
      vsnip = true,
      nvim_lsp = true,
      nvim_lua = true
    }
  }
)

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif check_back_space() then
    return t("<Tab>")
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  else
    return t("<S-Tab>")
  end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local npairs = require("nvim-autopairs")
vim.g.completion_confirm_key = ""
_G.completion_confirm_ = function()
  -- Get compe and autopairs working nicely
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

map("i", "<CR>", "v:lua.completion_confirm_()", {expr = true})
-- map("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", {expr = true})
map("i", "<C-space>", "compe#complete()", {expr = true})
-- }}}

-- formatter {{{
-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote"},
    stdin = true
  }
end
require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettier},
      typescript = {prettier},
      html = {prettier},
      css = {prettier},
      scss = {prettier},
      markdown = {prettier},
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- Runs Formatter on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)
