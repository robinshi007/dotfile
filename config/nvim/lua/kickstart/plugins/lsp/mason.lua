return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	ensure_installed = {
		-- formatters
		"shellcheck",
		"shfmt",
		"stylua",
		"prettier",
		"sqlfluff",
		"ruff",
		-- linters
		"htmlhint",
		"markdownlint",
		"stylelint",
		"eslint_d",
		"yamllint",
		"goimports",
		"gofumpt",
	},
	config = function(plugin)
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		local mr = require("mason-registry")
		for _, tool in ipairs(plugin.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
