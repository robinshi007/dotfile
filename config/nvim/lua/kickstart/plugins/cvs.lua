return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "≃" },
				untracked = { text = "│" },
			},

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- local function opts(desc)
				-- 	return { buffer = bufnr, desc = desc }
				-- end
				-- local map = vim.keymap.set
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "]h", gs.prev_hunk, "Prev Hunk")
				map("n", "[h", gs.next_hunk, "Next Hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "git [D]iff this against index")
				map("n", "<leader>hD", function()
					gs.diffthis("@")
				end, "git [D]iff this again last commit")
				map("n", "<leader>tB", gs.toggle_current_line_blame, "[T]oggle blame line")
				map("n", "<leader>tD", gs.toggle_deleted, "[T]oggle [D]deleted")
			end,
		},
		config = true,
	},
}
