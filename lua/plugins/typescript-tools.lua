return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup({
      settings = {
        tsserver_path = "/usr/lib/code/extensions/node_modules/typescript/lib/tsserver.js",
        expose_as_code_action = { "add_missing_imports" },
        publish_diagnostic_on = "insert_leave",
        separate_diagnostic_server = false,
        code_lens = "off",
        disable_member_code_lens = true,
        tsserver_max_memory = "3072",
        jsx_close_tag = {
          enable = false,
        },
      },
    })
  end,
}
