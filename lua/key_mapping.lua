-- insert
vim.keymap.set("i", "<Tab>", "<C-t>")
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- insert and command line
vim.keymap.set("!", "<C-a>", "<Home>")
vim.keymap.set("!", "<C-e>", "<End>")
vim.keymap.set("!", "<C-b>", "<Left>")
vim.keymap.set("!", "<C-f>", "<Right>")
vim.keymap.set("!", "<C-d>", "<Del>")
vim.keymap.set("!", "<M-f>", "<S-Right>")
vim.keymap.set("!", "<M-b>", "<S-Left>")

-- normal
-- vim.keymap.set('n', '<C-l>', function()
--   require('notify').dismiss()
--   vim.cmd('nohlsearch|diffupdate|normal! <C-L><CR>')
-- end)
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")
vim.keymap.set("n", "gV", "`[v`]")  -- re-select the last changed/yanked text

vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-j>", "<C-w>j")

vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")

vim.keymap.set("n", "<S-Left>", "<C-w>><CR>")
vim.keymap.set("n", "<S-Right>", "<C-w><<CR>")
vim.keymap.set("n", "<S-Up>", "<C-w>-<CR>")
vim.keymap.set("n", "<S-Down>", "<C-w>+<CR>")

vim.keymap.set("n", "<C-Tab>", "gt")
vim.keymap.set("n", "<C-S-Tab>", "gT")
vim.keymap.set("n", "<S-PageDown>", ":tabmove +1<CR>", { silent = true })
vim.keymap.set("n", "<S-PageUp>", ":tabmove -1<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

-- command
vim.keymap.set("c", "<C-x>", "<C-r>=expand('%:p')<CR>")

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
