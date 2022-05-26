local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
  return
end
  -- Lightspeed remap {{{
lightspeed.setup(
  {
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = false,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5
  }
)
function repeat_ft(reverse)
  local ls = require "lightspeed"
  ls.ft["instant-repeat?"] = true
  ls.ft:to(reverse, ls.ft["prev-t-like?"])
end

local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}
map("n", "<expr> f", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"', opt)
map("n", "<expr> F", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"', opt)
map("n", "<expr> t", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"', opt)
map("n", "<expr> T", 'reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"', opt)

map("n", ";", "<cmd>lua repeat_ft(false)<cr>", opt)
map("x", ";", "<cmd>lua repeat_ft(false)<cr>", opt)
map("n", ",", "<cmd>lua repeat_ft(true)<cr>", opt)
map("x", ",", "<cmd>lua repeat_ft(true)<cr>", opt)
---}}}
