local config_files_in_order_js = { { "biome", "biome" }, { "prettierrc", "prettierd" } }
local fallback = "biome"

local utils = require("scripts.conform")
utils.set_fallback(fallback)
local setup_formatter_by_config_file = utils.setup_formatter_by_config_file(config_files_in_order_js)

-- Docs https://www.lazyvim.org/plugins/formatting
local opts = {
  -- LazyVim will use these options when formatting with the conform.nvim formatter
  default_format_options = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },

  ---@type table<string, conform.FormatterUnit[] | function>
  formatters_by_ft = {
    -- json = { "biome" },
    typescriptreact = setup_formatter_by_config_file,
    typescript = setup_formatter_by_config_file,
    javascript = setup_formatter_by_config_file,
    javascriptreact = setup_formatter_by_config_file,
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
