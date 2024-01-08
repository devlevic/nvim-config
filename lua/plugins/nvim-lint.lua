return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      fish = { "fish" },
      typescript = { "biomejs" },
      typescriptreact = { "biomejs" },
      javascript = { "biomejs" },
      javascriptreact = { "biomejs" },
      json = { "biomejs" },
    },
    ---@type table<string,table>
    linters = {},
  },
}
