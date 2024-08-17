local util = require("lspconfig/util")
local M = {}

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						"vim",
						"require",
					},
				},
			},
		},
	},
	jsonls = {},
	tsserver = {
		disable_formatting = false,
	},
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "off",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {},
		},
	},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	},
}

local function lsp_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

local function lsp_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function M.setup(_)
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")

	lsp_attach(function(client, buffer)
		-- require("kickstart.plugins.lsp.format").on_attach(client, buffer)
		require("kickstart.configs.lsp.keymaps").on_attach(client, buffer)
	end)

	mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
	mason_lspconfig.setup_handlers({
		function(server)
			local opts = servers[server] or {}
			opts.capabilities = lsp_capabilities()
			lspconfig[server].setup(opts)
		end,
		-- ["rust_analyzer"] = function(server)
		-- 	local rt = require("rust-tools")
		-- 	local opts = servers[server] or {}
		-- 	opts.capabilities = lsp_capabilities()
		-- 	rt.setup({ server = opts })
		-- end,
	})
end

return M
