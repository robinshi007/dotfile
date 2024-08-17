return {
	{
		"goolord/alpha-nvim",
		lazy = false,
		opts = function()
			WEEKDAYS = {
				{

					"███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
					"████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
					"██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
					"╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
				{
					"████████╗██╗   ██╗███████╗██████╗██████╗  █████╗ ██╗   ██╗",
					"╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
					"   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
					"   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},

				{
					"██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
					"██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
					"██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
					" ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
				{
					"████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
					"╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
					"   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
					"   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔██║  ██║   ██║   ",
					"   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
				{
					"███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
					"██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
					"╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
				{
					"███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
					"╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
					"███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
					"╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
				{
					"███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
					"██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
					"███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
					"╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
					"███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
					"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
				},
			}
			local function getDayOfWeek()
				local dayOfWeek = os.date("%w")
				if dayOfWeek == "0" then
					dayOfWeek = "7"
				end
				return tonumber(dayOfWeek)
			end
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = WEEKDAYS[getDayOfWeek()]

			local function button(sc, txt, leader_txt, keybind, keybind_opts)
				local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

				local opts = {
					position = "center",
					shortcut = sc,
					cursor = 5,
					width = 50,
					align_shortcut = "right",
					hl = "AlphaButtons",
					hl_shortcut = "AlphaShortcut",
				}

				if nil == keybind then
					keybind = sc_after
				end
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_after, keybind, keybind_opts }

				local function on_press()
					-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
					local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
					vim.api.nvim_feedkeys(key, "t", false)
				end

				return {
					type = "button",
					val = txt,
					on_press = on_press,
					opts = opts,
				}
			end

			local leader = " "
			dashboard.section.buttons.val = {
				-- button("space f c", " Scheme change", leader, nil, {
				-- 	noremap = true,
				-- 	silent = true,
				-- 	nowait = true,
				-- 	callback = function()
				-- 		require("telescope.builtin").colorscheme()
				-- 	end,
				-- }),
				-- button("space f r", " File frecency", leader, nil, {
				-- 	noremap = true,
				-- 	silent = true,
				-- 	nowait = true,
				-- 	callback = function()
				-- 		require("telescope").extensions.frecency.frecency({})
				-- 	end,
				-- }),
				button("space f f", " File find", leader, nil, {
					noremap = true,
					silent = true,
					nowait = true,
					callback = function()
						require("telescope.builtin").find_files()
					end,
				}),
				button("space f w", " Find word", leader, nil, {
					noremap = true,
					silent = true,
					nowait = true,
					callback = function()
						require("telescope.builtin").live_grep()
					end,
				}),
				button("space f e", " File history", leader, nil, {
					noremap = true,
					silent = true,
					nowait = true,
					callback = function()
						require("telescope.builtin").oldfiles()
					end,
				}),
			}
			dashboard.section.buttons.opts.hl = "AlphaButtons"

			return dashboard
		end,
		config = function(_, opts)
			require("alpha").setup(opts.config)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				desc = "Add Alpha dashboard footer",
				once = true,
				callback = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
					opts.section.footer.val =
						{ " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
					-- opts.section.footer.opts.hl = "DashboardFooter"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "onedark",
			options = {
				mode = "tabs",
				separator_style = "slant",
			},
		},
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			debounce = 100,
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		config = true,
	},
	-- { "echasnovski/mini.statusline", version = "*", event = "VeryLazy", config = true },
	-- { "echasnovski/mini.indentscope", version = "*", event = "VeryLazy", config = true },
	{
		"echasnovski/mini.hipatterns",
		version = "*",
		event = "VeryLazy",
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		opts = {
			scroll = {
				enable = false,
			},
		},
	},
	{ "echasnovski/mini.cursorword", version = "*", event = "VeryLazy", config = true },
	{
		"echasnovski/mini.bufremove",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
	-- 		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
	-- 		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
	-- 		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
	-- 		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	-- 	},
	-- 	opts = {
	-- 		options = {
	--        -- stylua: ignore
	--        close_command = function(n) require("mini.bufremove").delete(n, false) end,
	--        -- stylua: ignore
	--        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
	-- 			diagnostics = "nvim_lsp",
	-- 			always_show_bufferline = false,
	-- 			offsets = {
	-- 				{
	-- 					filetype = "neo-tree",
	-- 					text = "Neo-tree",
	-- 					highlight = "Directory",
	-- 					text_align = "left",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local nvim_bufferline = require("bufferline")
	-- 		nvim_bufferline.setup(opts)
	-- 		-- Fix bufferline when restoring a session
	-- 		vim.api.nvim_create_autocmd("BufAdd", {
	-- 			callback = function()
	-- 				vim.schedule(function()
	-- 					pcall(nvim_bufferline)
	-- 				end)
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("notify").setup({
				timeout = 1500,
				stages = "static",
			})
			require("noice").setup()
		end,
	},
}
