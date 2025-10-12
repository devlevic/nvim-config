local config_files_in_order_js = { { "biome", "biome" }, { "prettierrc", "prettierd" }, { "dprint", "dprint" } }
local fallback = "biome"

local utils = require("scripts.conform")
utils.set_fallback(fallback)
local setup_formatter_by_config_file = utils.setup_formatter_by_config_file(config_files_in_order_js)

-- Docs https://www.lazyvim.org/plugins/formatting
local opts = function(_, opts)
  opts.default_format_options = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  }

  ---@type table<string, string[] | function>
  opts.formatters_by_ft = opts.formatters_by_ft

  opts.terraform = { "terraform" }
  opts.tf = { "terraform" }
  opts.typescriptreact = setup_formatter_by_config_file
  opts.typescript = setup_formatter_by_config_file
  opts.javascript = setup_formatter_by_config_file
  opts.javascriptreact = setup_formatter_by_config_file
  opts.go = { "gofmt" }
  opts.json = { "biome" }

  opts.formatters = {
    injected = { options = { ignore_errors = true } },
  }
end

vim.keymap.set("n", "<leader>cL", function()
  print("current formatter: " .. utils.current_formatter)
end, { desc = "Print current formatter" })

return {
  "stevearc/conform.nvim",
  opts = opts,
}
