return {
	-- editor
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true, --- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string
					javascript = { "template_string" },
				},
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>sw", "<cmd>lua require('spectre').toggle()<CR>", desc = "Spectre Toggle" },
		},
	},
	{
		"junegunn/vim-easy-align",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy Align" })
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy Align (visual)" })
		end,
	},
	{
		event = "VeryLazy",
		"mg979/vim-visual-multi",
		config = function() end,
	},
	{
		"m-demare/hlargs.nvim",
		event = "VeryLazy",
		config = true,
	},
}
