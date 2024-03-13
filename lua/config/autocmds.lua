-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local lens = require("scripts.lens")

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    lens.blameVirtText()
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = lens.clearBlameVirtText,
})
