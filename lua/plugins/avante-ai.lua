return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- provider = "groq",
    -- vendors = {
    --   groq = {
    --     __inherited_from = "openai",
    --     endpoint = "http://0.0.0.0:1337/v1",
    --     model = "Llama-3.2-3B-Instruct-IQ3_M",
    --     -- model = "llama3.2-1b-instruct",
    --     -- moddel = "Llama-3.2-1B-Instruct-IQ3_M",
    --   },
    -- },

    provider = "openai",
    ["gpt-o-mini"] = {
      model = "gpt-4o-mini", -- The model name to use with this provider
    },

    -- add any opts here
    -- provider = "deepseek",
    -- vendors = {
    --   deepseek = {
    --     __inherited_from = "openai",
    --     endpoint = "http://0.0.0.0:1337/v1",
    --     model = "deepseek-coder-1.3b",
    --   },
    -- },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
