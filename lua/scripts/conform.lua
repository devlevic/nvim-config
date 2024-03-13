local M = {
  current_formatter = "",
}

---@param  bufnr number
---@param  fmt string
local function is_fmt_available(bufnr, fmt)
  local fmt_info = require("conform").get_formatter_info(fmt, bufnr)

  return fmt_info.available
end

---@param filename string
local function file_exists(filename)
  local f = vim.fn.system("ls -a | grep " .. filename)
  if f ~= "" then
    return true
  else
    return false
  end
end

function M.setup_formatter_by_config_file(formatters_in_order)
  local formatter = M.fallback
  local filename = ""
  for _, value in ipairs(formatters_in_order) do
    local name = value[2]
    local have_config_file = file_exists(value[1])

    if have_config_file then
      formatter = name
      filename = value[1]
      break
    end
  end

  local function currying(bufnr)
    local is_available = is_fmt_available(bufnr, formatter)
    if is_available == false then
      print("Match found for [" .. filename .. "] but the formatter [" .. formatter .. "] was not found")

      if M.fallback == "" then
        print("fallback option was not found")
        return {}
      end

      local is_fallback_available = is_fmt_available(bufnr, formatter)
      if is_fallback_available then
        print("fallback to [" .. M.fallback .. "]")
        return { M.fallback }
      end
      return {}
    end

    M.current_formatter = formatter
    return { formatter }
  end

  return currying
end

---@param value string
function M.set_fallback(value)
  M.fallback = value
end

return M
