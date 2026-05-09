-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add <C-e> to toggle file explorer
local map = vim.keymap.set
-- local del = vim.keymap.del

local status, _ = pcall(require, "snacks")
if status then
  map("n", "<C-e>", "<cmd>lua require('snacks').explorer.open()<CR>", { silent = true, desc = "Toggle explorer" })
end
