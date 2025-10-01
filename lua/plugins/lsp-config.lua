-- lua/plugins/lsp-code-action-on-save.lua

local config = {
  enable_auto_apply = false,
}

vim.keymap.set("n", "<leader>uub", function()
  if config.enable_auto_apply then
    config.enable_auto_apply = false
  else
    config.enable_auto_apply = true
  end

  print("Auto apply code action: " .. tostring(config.enable_auto_apply))
end, { desc = "Toggle auto apply" })

return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      -- You can configure this globally or per-server
      -- Below is a global setup for all LSPs
      ["*"] = function(_, opts)
        local lsp_formatting = function(bufnr)
          if config.enable_auto_apply == true then
            vim.lsp.buf.code_action({
              context = {
                only = { "source.fixAll.biome" }, -- or remove `only` to include all code actions
                diagnostics = {},
              },
              apply = true,
            })
          end
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(args)
            lsp_formatting(args.buf)
          end,
          group = vim.api.nvim_create_augroup("LspCodeActionOnSave", { clear = true }),
        })

        return false -- Do not override default setup
      end,
    },
  },
}
