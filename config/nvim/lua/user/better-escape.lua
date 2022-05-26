local status_ok, better_escape = pcall(require, "better-escape")
if not status_ok then
  return
end

better_escape.setup({})
