-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load options
require("custom.options")

-- Configure lszy.nvim
require("lazy").setup({
	lazy = false,
	import = "kickstart.plugins",
}, {
	import = "custom.plugins",
}, require("custom.configs.lazy"))

-- load autocmd and keymaps
vim.schedule(function()
	require("custom.autocmds")
	require("custom.keymaps")
end)

-- Lazy Keymap
vim.keymap.set("n", "<leader>zz", "<cmd>:Lazy<cr>", { desc = "Plugin Manager" })
