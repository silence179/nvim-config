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
if vim.g.neovide then
    -- 开启轨道炮粒子特效
    vim.g.neovide_cursor_vfx_mode = "railgun"
    -- 调整光标动画速度
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_capacity = 0.85
end
