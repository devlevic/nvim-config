-- Docs https://www.lazyvim.org/plugins/formatting
local opts = {
  -- LazyVim will use these options when formatting with the conform.nvim formatter
  -- format = {
  --   timeout_ms = 3000,
  --   async = false, -- not recommended to change
  --   quiet = false, -- not recommended to change
  -- },

  ---@type table<string, conform.FormatterUnit[]>
  formatters_by_ft = {
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
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
