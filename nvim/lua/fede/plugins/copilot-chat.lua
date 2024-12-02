return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      question_header = "## Fede ",

      -- See Configuration section for rest
      window = {
        layout = "vertical",
        relative = "editor",
        border = "rounded",
      },
      auto_follow_cursor = false,
      prompts = {
        MonoCommitStaged = {
          prompt = "Write commit message for the change with commitizen convention for monorepo. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          context = "git",
          selection = function()
            return require("CopilotChat.select").gitdiff()
          end,
        },
        FixDiagnostics = {
          prompt = "Fix the following diagnostic issues in the code. Provide detailed explanations for each fix.",
          selection = function(source)
            return require("CopilotChat.select").line(source).diagnostics()
          end,
        },
      },
    },
    keys = {
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

      --  Show prompts actions that explain
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain" },
      { "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize" },

      -- Generate commit message based on the git diff
      {
        "<leader>cca",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>ccm",
        "<cmd>CopilotChatMonoCommitStaged<cr>",
        desc = "CopilotChat - Generate commit message for staged changes in monorepo",
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
