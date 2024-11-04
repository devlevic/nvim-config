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

vim.keymap.set("n", "<leader>uo", "<cmd>Outline<cr>", { desc = "Open outline" })

vim.keymap.set("n", "<leader>ccf", function()
  local lazy = require("lazy.core.util")
  local helper = require("scripts.conform")
  lazy.info("current formatter: " .. helper.current_formatter)
end, { desc = "Formatter info" })

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

vim.keymap.set("n", "tf", function()
  OpenTerminal(vim.v.count, "float")
end)

vim.keymap.set("n", "ta", "<cmd>ToggleTermToggleAll<cr>")

vim.keymap.set("n", "<leader>dm", "<cmd>:delm! | delm A-Z0-9<cr>", { desc = "Delete all marks" })

-- CPP commands
--

vim.keymap.set("n", "<F9>", function()
  local currentFileFullPath = vim.fn.expandcmd("%")
  local currentFileName = vim.fn.expandcmd("%:t:r")
  OpenTerminal(
    vim.v.count,
    "vertical",
    "g++ -pedantic-errors -o " .. currentFileName .. " " .. currentFileFullPath .. "  && ./" .. currentFileName,
    ".",
    false
  )
end)
