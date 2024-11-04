return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  -- adapters = { "pwa-node" },
  -- config = function()
  --   local dap = require("dap")
  --
  --   require("dap").adapters["pwa-node"] = {
  --     type = "server",
  --     host = "localhost",
  --     port = "${port}",
  --     executable = {
  --       command = "node",
  --       -- 💀 Make sure to update this path to point to your installation
  --       args = { "/home/levi/.config/nvim/debug/js-debug-dap/js-debug/src/dapDebugServer.js", "${port}" },
  --     },
  --   }
  --
  --   for _, language in ipairs({ "typescript", "javascript" }) do
  --     dap.configurations[language] = {
  --       {
  --         type = "pwa-node",
  --         -- debugger_path = "/home/levi/.config/nvim/debug/vscode-js-debug-1.85.0/src/dap",
  --         request = "attach",
  --         name = "pwa-node",
  --         --- processId = require("dap.utils").pick_process,
  --         -- cwd = "${workspaceFolder}",
  --       },
  --     }
  --   end
  -- end,
}
