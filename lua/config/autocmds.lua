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

-- Set font styles
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Comment
    vim.cmd('hi Comment guifg=#4caee2 gui=italic')
    -- Keyword
    vim.cmd('hi Keyword gui=bold')
    -- Variable
    vim.cmd('hi Variable gui=italic')
    -- Function
    vim.cmd('hi Function gui=italic')
    -- Number
    vim.cmd('hi Number guifg=#AE81FF')
    -- Type
    vim.cmd('hi Type gui=bold')
  end
})
