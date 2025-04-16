return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      -- { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      question_header = "## Fede ",
      model = "claude-3.7-sonnet",
      sticky = {
        "@models Using claude-3.7-sonnet",
        "#files",
      },

      -- See Configuration section for rest
      window = {
        layout = "vertical",
        relative = "editor",
      },
      prompts = {
        MonoCommitStaged = {
          prompt = "Write commit message for the change with commitizen convention for monorepo. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          context = "git:staged",
          selection = function(source)
            return require("CopilotChat.select").gitdiff(source)
          end,
        },
        FixDiagnostics = {
          prompt = "Fix the following diagnostic issues in the code. Provide detailed explanations for each fix.",
          context = "buffer",
          system_prompt = "COPILOT_REVIEW",
          selection = function(source)
            return require("CopilotChat.select").line(source).diagnostics
          end,
        },
        Rename = {
          prompt = "Please rename the fallowing variable correctly base on selected context",
          selection = function(source)
            local select = require("CopilotChat.select")
            return select.visual(source)
          end,
        },
      },
    },
    keys = {
      -- Show prompts actions with telescope
      {
        mode = "n",
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "CopilotChat - Prompt actions",
      },

      --  Show prompts actions that explain
      { mode = "n", "<leader>cce", ":CopilotChatExplain<CR>", desc = "CopilotChat - Explain" },

      { mode = "n", "<leader>ccf", ":CopilotChatFix<CR>", desc = "CopilotChat - Fix" },

      { mode = "n", "<leader>cco", ":CopilotChatOptimize<CR>", desc = "CopilotChat - Optimize" },

      -- Generate commit message based on the git diff
      {
        "<leader>cca",
        ":CopilotChatCommit<CR>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>ccm",
        ":CopilotChatMonoCommitStaged<CR>",
        desc = "CopilotChat - Generate commit message for staged changes in monorepo",
      },
      -- Rename Variable
      {
        mode = "v",
        "<leader>crv",
        ":CopilotChatRename<CR>",
        desc = "CopilotChat - rename variables for the selected context",
      },
      -- Fix diagnostic
      {
        mode = "n",
        "<leader>cfd",
        ":CopilotChatFixDiagnostics<CR>",
        desc = "CopilotChat - rename variables for the selected context",
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
        "<leader>ac",
        ":CopilotChat<CR>",
        desc = "CopilotChat - Chat",
      },
      {
        mode = "v",
        "<leader>ac",
        ":CopilotChat<CR>",
        desc = "CopilotChat - Chat",
      },
    },
  },
}
