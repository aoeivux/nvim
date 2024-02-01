-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
}) -- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})
-- 设置字体样式
vim.cmd([[
  " 注释
  " hi Comment guifg=#4caee2 gui=italic
  " 关键字
  hi Keyword gui=bold
  " 变量
  hi Variable gui=italic
  " 函数
  hi Function gui=italic
  " 数字
  hi Number guifg=#AE81FF
  " 类型
  hi Type gui=bold
]])
