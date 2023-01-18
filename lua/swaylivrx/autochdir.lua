-- auto change dir
vim.api.nvim_command('set noautochdir')

vim.cmd [[
autocmd VimEnter * set noautochdir
]]
