return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      question_header = "## Fede ",

      -- See Configuration section for rest
      window = {
        layout = "float",
        relative = "editor",
        border = "shadow",
      },
    },
    keys = {
      -- Show help actions with telescope
      {
        "<leader>ah",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },

      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain" },
      { "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize" },

      -- Generate commit message based on the git diff
      {
        "<leader>cca",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      {
        "<leader>ccs",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "CopilotChat - Generate commit message for staged changes",
      },

      {
        mode = "n",
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        mode = "n",
        "<leader>cc",
        function()
          require("CopilotChat").ask("", { selection = require("CopilotChat.select").buffer })
        end,
        desc = "CopilotChat - Chat",
      },
    },
  },
}
