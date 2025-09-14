vim.keymap.set("n", "<C-a>b", function()
	print("hello world")
end, { silent = true })

vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
-- 终端模式 Esc 退出
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><C-w>c", { silent = true })
vim.keymap.set("n", "H", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "L", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<C-p>", "<Cmd>cclose<CR>")
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","

