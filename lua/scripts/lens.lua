-- reference: https://teukka.tech/vimtip-gitlens.html
-- in utils.lua
local M = {}
local api = vim.api
local ns_id = api.nvim_create_namespace("GitLens") -- create a new_namespace
local buff_nr = 0
local col = 0
local virt_text_color = 5

function M.blameVirtText()
  local ft = vim.fn.expand("%:h:t") -- get the current file extension
  local invalid_files = { "", ".", "bin" }

  for _, value in ipairs(invalid_files) do
    if ft == value then
      return
    end
  end

  M.clearBlameVirtText()
  local currFile = vim.fn.expand("%")
  local line = api.nvim_win_get_cursor(buff_nr)
  local blame = vim.fn.system(string.format("git blame -c -L %d,%d %s", line[1], line[1], currFile))
  local hash = vim.split(blame, "%s")[1]
  local cmd = string.format("git show %s ", hash) .. "--format='%an | %ar | %s'"
  local text = ""
  if hash == "00000000" then
    text = "Not Committed Yet"
  else
    text = vim.fn.system(cmd)
    text = vim.split(text, "\n")[1]
    if text:find("fatal") then
      text = "Not Committed Yet"
    end
  end
  api.nvim_buf_set_extmark(buff_nr, ns_id, line[1] - 1, col, { virt_text = { { text, virt_text_color } } })
end

function M.clearBlameVirtText()
  api.nvim_buf_clear_namespace(buff_nr, ns_id, 0, -1)
end

return M
