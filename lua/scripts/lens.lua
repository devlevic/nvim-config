-- reference: https://teukka.tech/vimtip-gitlens.html
-- in utils.lua
local M = {}
local api = vim.api
local ns_id = api.nvim_create_namespace("GitLens") -- create a new_namespace

function M.blameVirtText()
  local ft = vim.fn.expand("%:h:t") -- get the current file extension

  if ft == "" then -- if we are in a scratch buffer or unknown filetype
    return
  end
  if ft == "." then -- if we are in file explorer
    return
  end
  if ft == "bin" then -- if we are in nvim's terminal window
    return
  end

  api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  local currFile = vim.fn.expand("%")
  local line = api.nvim_win_get_cursor(0)
  local blame = vim.fn.system(string.format("git blame -c -L %d,%d %s", line[1], line[1], currFile))
  local hash = vim.split(blame, "%s")[1]
  local cmd = string.format("git show %s ", hash) .. "--format='%an | %ar | %s'"
  if hash == "00000000" then
    text = "Not Committed Yet"
  else
    text = vim.fn.system(cmd)
    text = vim.split(text, "\n")[1]
    if text:find("fatal") then
      text = "Not Committed Yet"
    end
  end
  api.nvim_buf_set_extmark(0, ns_id, line[1] - 1, 0, { virt_text = { { text, 5 } } })
end

function M.clearBlameVirtText()
  api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
end

return M
