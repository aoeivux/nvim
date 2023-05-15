-- where put your overrides defaults options
-- autocmds & globals
-- snippets

-- Custom snippets
vim.g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"
vim.o.swapfile = false

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
-- opt.expandtab = true
-- opt.shiftwidth = 2
-- opt.smartindent = true
-- opt.tabstop = 2
-- opt.softtabstop = 2

-- Custom Indenting
opt.expandtab = false
opt.tabstop=2
opt.shiftwidth=2
opt.softtabstop=2
opt.autoindent=true

-- Others
opt.relativenumber = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = true
opt.showcmd = true
opt.wildmenu = true
opt.history=1000

-- Detecting file to indent
-- vim.cmd[[
-- autocmd Filetype html setlocal ts=4 sw=4 expandtab
-- autocmd Filetype cpp setlocal ts=4 sw=4 expandtab
-- autocmd Filetype c setlocal ts=4 sw=4 expandtab
-- autocmd Filetype go setlocal ts=4 sw=4 expandtab
-- autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
-- autocmd Filetype java setlocal ts=2 sw=2 sts=0 expandtab
-- ]]



-- NvimTree open on setup
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


