local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup(
{
  numhl = true,
  signcolumn = false,
  signs = {
    add = {hl = "GitGutterAdd", text = "+"},
    change = {hl = "GitGutterChange", text = "~"},
    delete = {hl = "GitGutterDelete", text = "_"},
    topdelete = {hl = "GitGutterDelete", text = "‾"},
    changedelete = {hl = "GitGutterChange", text = "~"}
  }
}
)
