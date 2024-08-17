return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		-- { "folke/neoconf.nvim", config = true },
		-- { "folke/neodev.nvim", config = true },
		{ "smjonas/inc-rename.nvim", config = true },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function(plugin)
		require("kickstart.configs.lsp.servers").setup(plugin)
	end,
}
