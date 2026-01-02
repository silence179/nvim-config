vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

vim.opt.autoread = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
})
vim.lsp.enable('rust_analyzer')
vim.opt.autochdir = true
