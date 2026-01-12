local js_files = { "biome" }

-- Docs https://www.lazyvim.org/plugins/formatting
local opts = function(_, opts)
  opts.default_format_options = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  }

  ---@type table<string, string[] | function>
  opts.formatters_by_ft = opts.formatters_by_ft

  opts.typescriptreact = js_files
  opts.typescript = js_files
  opts.javascript = js_files
  opts.javascriptreact = js_files
  opts.terraform = { "terraform" }
  opts.tf = { "terraform" }
  opts.go = { "gofmt" }
  opts.json = js_files

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
