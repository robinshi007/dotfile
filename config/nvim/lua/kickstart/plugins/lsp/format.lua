return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local format_opts = {
			lsp_format = "fallback",
			async = false,
			timeout_ms = 1500,
		}

		conform.setup({
			formatters_by_ft = {
				sh = { "shfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				sql = { "sqlfluff" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_organize_imports", "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				rust = { "rustfmt" },
				go = { "goimports", "gofmt" },
				["-"] = { "trim_whitespace" },
			},
			format_on_save = format_opts,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format(format_opts)
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
