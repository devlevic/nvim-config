-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer switch
--

local Util = require("lazyvim.util")

vim.keymap.set("n", "bmn", "<cmd>BufferLineCycleNext<cr>", { desc = "Move to the next buffer" })
vim.keymap.set("n", "bmp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Move to the previous buffer" })

-- Window splitting
--
vim.keymap.set("n", "<A-h>", "<cmd>split<cr>", { desc = "Move to the next buffer" })
vim.keymap.set("n", "<A-v>", "<cmd>vsplit<cr>", { desc = "Move to the previous buffer" })

-- Terminal
--
vim.keymap.set("n", "th", function()
  vim.cmd("split | terminal")
  Util.toggle.number()
end)

vim.keymap.set("n", "tv", function()
  vim.cmd("vsplit | terminal")
  Util.toggle.number()
end)
