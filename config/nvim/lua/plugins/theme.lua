return {
  'navarasu/onedark.nvim',
  config = function()
    local status_ok, color_scheme = pcall(require, 'onedark')
    if not status_ok then
      return
    end

    color_scheme.setup({
      style = 'darker',
      colors = { fg = '#b2bbcc' }  -- default: #a0a8b7
    })
    color_scheme.load()
  end,

  onedark_dark = {
    bg = '#282c34',
    fg = '#b2bbcc',
    pink = '#c678dd',
    green = '#98c379',
    cyan = '#56b6c2',
    yellow = '#e5c07b',
    orange = '#d19a66',
    red = '#e86671',
  }
}
