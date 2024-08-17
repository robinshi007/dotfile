local map = vim.keymap.set

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })

-- Copy/paste with system clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Better indent
map("v", "<", "<gv", { desc = "Move indent left visial" })
map("v", ">", ">gv", { desc = "Move indent right visial" })

map("n", "<Tab>", "<cmd>bn<CR>", { desc = "Buffer Go to next" })
map("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Buffer Go to prev" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Buffer delete" })

-- Move Lines
-- map("v", "K", "<cmd>m '>+1<CR>gv=gv", { desc = "Move Down Select Lines" })
-- map("v", "J", "<cmd>m '<-2<CR>gv=gv", { desc = "Move Up Select Lines" })
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down visial", silent = true })
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines down visial", silent = true })
-- map("n", "J", ":m .+1<CR>==", { desc = "Move lines down", silent = true })
-- map("n", "K", ":m .-2<CR>==", { desc = "Move lines down", silent = true })

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
-- stylua: ignore
map("n", "<C-s>", "<cmd>w<CR>", { desc = "File save" })
map({ "i", "x" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save and go to Normal mode" })
map("n", "<C-c>", "<Cmd>%y+<CR>", { desc = "File copy whole" })

-- Window navigation
map("n", "<C-H>", "<C-w>h", { desc = "Focus on left window" })
map("n", "<C-J>", "<C-w>j", { desc = "Focus on below window" })
map("n", "<C-K>", "<C-w>k", { desc = "Focus on above window" })
map("n", "<C-L>", "<C-w>l", { desc = "Focus on right window" })

-- stylua: ignore
-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>")
map("n", "<S-Down>", "<cmd>resize -2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Toggle without feedback
local toggle_prefix = [[\]]
local map_toggle = function(lhs, rhs, desc)
	map("n", toggle_prefix .. lhs, rhs, { desc = desc })
end
-- map_toggle("b", '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"<CR>', "Toggle 'background'")
map_toggle("c", "<Cmd>setlocal cursorline!<CR>", "Toggle 'cursorline'")
map_toggle("C", "<Cmd>setlocal cursorcolumn!<CR>", "Toggle 'cursorcolumn'")
map_toggle("d", "<Cmd>lua MiniBasics.toggle_diagnostic()<CR>", "Toggle diagnostic")
map_toggle("h", "<Cmd>let v:hlsearch = 1 - v:hlsearch<CR>", "Toggle search highlight")
map_toggle("i", "<Cmd>setlocal ignorecase!<CR>", "Toggle 'ignorecase'")
map_toggle("l", "<Cmd>setlocal list!<CR>", "Toggle 'list'")
map_toggle("n", "<Cmd>setlocal number!<CR>", "Toggle 'number'")
map_toggle("r", "<Cmd>setlocal relativenumber!<CR>", "Toggle 'relativenumber'")
map_toggle("s", "<Cmd>setlocal spell!<CR>", "Toggle 'spell'")
map_toggle("w", "<Cmd>setlocal wrap!<CR>", "Toggle 'wrap'")

-- Disable default keymaps
map("n", "<C-e>", "<Nop>")
