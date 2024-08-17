return {
	-- colorscheme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local onedark = require("onedark")
			onedark.setup({
				-- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'light', 'lighter'
				style = "dark",
			})
			onedark.load()
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			background = { -- :h background
	-- 				light = "latte",
	-- 				dark = "frappe",
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
}
