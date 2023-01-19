local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- 打开时自动定位到上次关闭位置
autocmd(
	{ "BufReadPost" },
	{ pattern = "*", command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- auto change dir noautochdir
vim.api.nvim_command('set noacd')
vim.cmd [[ autocmd VimEnter * set noacd ]]

