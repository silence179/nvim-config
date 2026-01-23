vim.keymap.set("n", "<C-a>b", function()
	print("hello world")
end, { silent = true })

vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set("n", "H", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "L", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<C-p>", "<Cmd>cclose<CR>")
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- 用 Alt + hjkl 直接切换分屏 (无需先按 Ctrl-w)
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

vim.keymap.set({'n','t'}, '<C-_>', '<cmd>ToggleTerm<cr>', { silent = true })
