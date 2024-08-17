local plugins = {}

local _plugins = {
	require("kickstart.plugins.ui"),
	require("kickstart.plugins.nav"),
	require("kickstart.plugins.cvs"),
	require("kickstart.plugins.treesitter"),
	require("kickstart.plugins.colorscheme"),
	require("kickstart.plugins.editor"),
	require("kickstart.plugins.lsp"),
	require("kickstart.plugins.lang"),
}

for _, p in ipairs(_plugins) do
	vim.list_extend(plugins, p)
end

return plugins
