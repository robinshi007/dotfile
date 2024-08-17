return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"bash",
				"json",
				"sql",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"html",
				"css",
				"yaml",
				"toml",
				"python",
				"go",
				"rust",
				"solidity",
			},
			sync_install = false,
			highlight = { enable = true, use_languagetree = true },
			indent = { enable = true, disable = { "ruby" } },
		})
	end,
}
