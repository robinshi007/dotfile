local mapset = require('core/utils').mapset

local M = {}

M.init = function()
  return {
    git = {
      clone_timeout = 180,
    },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
    profile = {
      enable = true,
      threshold = 1,
    },
  }
end

M.use = function(plugins)
  return function(use)
    use({ 'wbthomason/packer.nvim' })
    for _, plugin in ipairs(plugins) do
      if plugin.group ~= nil then
        -- for grouped plugins
        for _, subplugin in ipairs(plugin.group) do
          use(subplugin)
        end
      else
        use(plugin)
      end
    end
  end
end

M.keymap = function(plugins)
  for _, plugin in ipairs(plugins) do
    if plugin.group ~= nil then
        -- for grouped plugins
        for _, subplugin in ipairs(plugin.group) do
          if subplugin.keymaps ~= nil then
            for _, keymap in ipairs(subplugin.keymaps) do
              mapset(keymap[1], keymap[2], keymap[3], keymap[4])
            end
          end
        end
    else
      if plugin.keymaps ~= nil then
        for _, keymap in ipairs(plugin.keymaps) do
          mapset(keymap[1], keymap[2], keymap[3], keymap[4])
        end
      end
    end
  end
end

return M
