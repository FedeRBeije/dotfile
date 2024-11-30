return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    require("neogit").setup({
      kind = "tab",
      commit_editor = {
        kind = "vsplit",
      },
      commit_view = {
        kind = "vsplit",
        verify_commit = false,
      },
    })
  end,
}
