---@type function
---@param bufnr integer
---@param fmt string
local function is_fmt_available(bufnr, fmt)
  local fmt_info = require("conform").get_formatter_info(fmt, bufnr)

  return fmt_info.available
end

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function biome_or_prettier(bufnr)
  local have_biome_config = file_exists("./biome.json")

  if have_biome_config then
    return { "biome" }
  end

  local have_prettier_config = file_exists("./.prettierrc")
  if have_prettier_config then
    return { "prettierd" }
  end

  print("fallback to [prettierd]")
  return { "prettierd" }
end

-- Docs https://www.lazyvim.org/plugins/formatting
local opts = {
  -- LazyVim will use these options when formatting with the conform.nvim formatter
  format = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },

  ---@type table<string, conform.FormatterUnit[] | function>
  formatters_by_ft = {
    -- javascript = { "biome" },
    -- javascriptreact = { "prettierd", "biome" },
    -- typescript = { "biome" },
    -- json = { "biome" },
    typescriptreact = biome_or_prettier,
    typescript = biome_or_prettier,
    javascript = biome_or_prettier,
    javascriptreact = biome_or_prettier,
  },

  -- ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
  -- formatters = {
  --   injected = { options = { ignore_errors = true } },
  -- },
}

return {
  "stevearc/conform.nvim",
  opts = opts,
}
