return {
	-- nav: neo-tree, telescope, bufline, outline
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				-- 	event_handlers = {
				-- 		{
				-- 			event = "file_opened",
				-- 			handler = function(file_path)
				-- 				-- auto close
				-- 				vim.cmd("Neotree close")
				-- 				-- OR
				-- 				-- require("neo-tree.command").execute({ action = "close" })
				-- 			end,
				-- 		},
				-- 	},

				window = {
					mappings = {
						["e"] = function()
							vim.api.nvim_exec("Neotree focus filesystem left", true)
						end,
						["b"] = function()
							vim.api.nvim_exec("Neotree focus buffers left", true)
						end,
						-- ["g"] = function()
						-- 	vim.api.nvim_exec("Neotree focus git_status left", true)
						-- end,
					},
				},

				default_component_configs = {
					git_status = {
						-- symbols = false,
						symbols = {
							-- Change type
							added = "✚",
							deleted = "✖",
							modified = "",
							renamed = "➜",
							-- Status type
							untracked = "★",
							ignored = "◌",
							unstaged = "✗",
							staged = "✓",
							conflict = "",
						},
						align = "right",
					},
				},
			})
		end,
		keys = function()
			-- local find_buffer_by_type = function(type)
			-- 	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- 		local ft = vim.api.nvim_buf_get_option(buf, "filetype")
			-- 		if ft == type then
			-- 			return buf
			-- 		end
			-- 	end
			-- 	return -1
			-- end
			-- local toggle_neotree = function(toggle_command)
			-- 	if find_buffer_by_type("neo-tree") > 0 then
			-- 		require("neo-tree.command").execute({ action = "close" })
			-- 	else
			-- 		toggle_command()
			-- 	end
			-- end

			return {
				{
					"<C-e>",
					"<cmd>Neotree filesystem reveal left toggle<CR>",
					desc = "Toggle Neotree(cwd)",
				},
			}
		end,
	},
	{
		"stevearc/aerial.nvim",
		event = "VeryLazy",
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		},
		keys = {
			{ "<leader>a", "<cmd>AerialToggle!<CR>}" },
		},
		config = function(_, opts)
			require("aerial").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		branch = "0.1.x",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
			{ "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Find words" },
			{ "<leader>fe", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Find recently used" },
			{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Find help_tags" },
			{ "<leader>fa", "<cmd>lua require('telescope').extensions.aerial.aerial()<cr>", desc = "Find tags" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("aerial")
			telescope.setup({
				extenstions = {
					aerial = {
						show_nesting = {
							["_"] = true,
							json = true,
							yaml = true,
						},
					},
				},
			})
		end,
	},
}
