-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer switch
--

vim.keymap.set("n", "bmn", "<cmd>BufferLineCycleNext<cr>", { desc = "Move to the next buffer" })
vim.keymap.set("n", "bmp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Move to the previous buffer" })

-- Window splitting
--
vim.keymap.set("n", "<A-h>", "<cmd>split<cr>", { desc = "Move to the next buffer" })
vim.keymap.set("n", "<A-v>", "<cmd>vsplit<cr>", { desc = "Move to the previous buffer" })

-- Terminal
--

local Terminal = require("toggleterm.terminal").Terminal

function OpenTerminal(count, direction, cmd, dir, close_on_exit)
  local size = 12
  if direction == "vertical" then
    size = 60
  end
  Terminal:new({ direction = direction, count = count, cmd = cmd, dir = dir, close_on_exit = close_on_exit })
    :toggle(size)
end

vim.keymap.set("n", "th", function()
  OpenTerminal(vim.v.count, "horizontal")
end)

vim.keymap.set("n", "tv", function()
  OpenTerminal(vim.v.count, "vertical")
end)

vim.keymap.set("n", "ta", "<cmd>ToggleTermToggleAll<cr>")
