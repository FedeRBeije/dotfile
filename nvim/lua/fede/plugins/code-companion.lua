return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    -- "j-hui/fidget.nvim",
  },
  config = function()
    require("codecompanion").setup({
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                -- default = "claude-3.7-sonnet",
                default = "gemini-2.5-pro",
              },
            },
          })
        end,
      },
    })
  end,
  keys = {
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion",
    },
    {
      "<leader>ci",
      "<cmd>CodeCompanion<cr>",
      desc = "CodeCompanion inline assistant",
    },
    {
      "<leader>cn",
      "<cmd>CodeCompanionChat<cr>",
      desc = "CodeCompanion new chat",
    },
    {
      "<leader>cp",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion prompt actions",
    },
    {
      mode = "v",
      "<leader>ca",
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "CodeCompanion add visual selection",
    },
  },
  -- init = function()
  --   require("../utils/fidget-spinner.lua"):init()
  -- end,
}
