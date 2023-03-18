-- where put your overrides defaults options
-- autocmds & globals
-- snippets

local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- save last place
autocmd(
	{ "BufReadPost" },
	{ pattern = "*", command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- auto change dir noautochdir
vim.api.nvim_command('set noacd')
vim.cmd [[ autocmd VimEnter * set noacd ]]


-- gerneral
opt.scrolloff = 8

-- close backup
opt.backup = false
opt.wb = false
opt.swapfile = false

-- Default Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true

-- Detecting file to indent
vim.cmd[[
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 expandtab
autocmd Filetype c setlocal ts=4 sw=4 expandtab
autocmd Filetype go setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype java setlocal ts=2 sw=2 sts=0 expandtab
]]
