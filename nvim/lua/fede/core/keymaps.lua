vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without lost register" })
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>ta", "<cmd>tabonly<CR>", { desc = "Close all tabs but current" }) --  close all tabs but current
-- neogit & diffview
keymap.set("n", "<leader>ng", ":Neogit<cr>") -- open neogit
keymap.set("n", "<leader>ngc", ":tabclose<cr>") -- close neogit
keymap.set("n", "<leader>ngP", ":Neogit push<cr>") -- push to remote
keymap.set("n", "<leader>ngl", ":Neogit log<cr>") -- log
keymap.set("n", "<leader>ngp", ":NeoGit pull<cr>") -- pull from remote
keymap.set("n", "<leader>do", ":DiffviewOpen<cr>") -- diff
keymap.set("n", "<leader>dc", ":DiffviewClose<cr>") -- close diff
keymap.set("n", "<leader>dh", ":DiffviewFileHistory %<cr>") -- diff file history
keymap.set("n", "<leader>gs", ":ShowGitStatus<CR>", { silent = true })
