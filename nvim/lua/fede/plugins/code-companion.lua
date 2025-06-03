return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "tpope/vim-sleuth", -- Automatically detects which indents should be used in the current buffer
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "ravitemer/mcphub.nvim", -- Manage MCP servers
      cmd = "MCPHub",
      build = "npm install -g mcp-hub@latest",
      config = true,
    },
    {
      "echasnovski/mini.diff", -- Inline and better diff over the default
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          -- Disabled by default
          source = diff.gen_source.none(),
        })
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
    {
      "Davidyz/VectorCode", -- Index and search code in your repositories
      version = "*",
      build = "pipx upgrade vectorcode",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    "j-hui/fidget.nvim",
  },
  opts = {
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
              default = "claude-sonnet-4",
              -- default = "gemini-2.5-pro",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        keymaps = {
          send = {
            modes = {
              n = { "<CR>", "<C-s>" },
              i = "<C-s>",
            },
            callback = function(chat)
              vim.cmd("stopinsert")
              chat:add_buf_message({ role = "llm", content = "" })
              chat:submit()
            end,
            index = 1,
            description = "Send",
          },
          close = {
            modes = {
              n = "q",
              i = "<C-c>",
            },
            index = 4,
            callback = "keymaps.close",
            description = "Close Chat",
          },
          stop = {
            modes = {
              n = "<C-q>",
            },
            index = 5,
            callback = "keymaps.stop",
            description = "Stop Request",
          },
        },
        roles = {
          user = "🐳 Fede",
        },
      },
    },
    prompt_library = {
      ["Boilerplate REACT NATIVE"] = {
        strategy = "inline",
        description = "Generate some boilerplate React native code",
        opts = {
          mapping = "<LocalLeader>ch",
        },
        prompts = {
          {
            role = "system",
            content = "You are an expert React native programmer",
          },
          {
            role = "user",
            content = "<user_prompt>Please generate some React native function boilerplate for me by the given file name. Return the code only and no markdown codeblocks</user_prompt>",
          },
        },
      },
    },
  },
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
  init = function()
    require("fede.utils.inline-spinner"):init()
  end,
}
