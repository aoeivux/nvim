local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"



-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- NOTE: require winshit plugin
keymap("n", "<C-W>m", ":WinShift<cr>", opts)

-- quickly move 
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)

keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)


-- quickly save && quit
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "S", ":w<CR>", opts)

-- FileExpoler

keymap("n", "tt", ":NvimTreeToggle<CR>", opts)
-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)
-- save buffer
keymap("n", "<leader>w", ":w<cr>", opts)
-- exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)
-- delete cur buffer
keymap("n", "<leader>d", ":bdelete<cr>", opts)
keymap("n", "<leader>D", ":bdelete<cr>", opts)
-- exit whole program
keymap("n", "ZZ", ":lua require('utils').SaveAndExit()<cr>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-p>", ":BufferLineCyclePrev<CR>", opts)

-- Navigate line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- git diff view
keymap('n', '<leader>j', ']c', opts)
keymap('n', '<leader>k','[c', opts)


-- unit test
keymap("n", "<leader>rr", "<cmd>UltestNearest<cr>", opts)
keymap("n", "<leader>rd", "<cmd>UltestDebugNearest<cr>", opts)

-- comment
keymap("n", "gcf", "<cmd>Dox<cr>", opts)

-- sniprun
keymap("n", "<leader>rf", ":%SnipRun<cr>", opts)
keymap("v", "<leader>rs", ":%SnipRun<cr>", opts)

-- replace words 
vim.cmd(
[[
" line
  nnoremap <leader>s :s/\<<C-r><C-w>\>//g<left><left>
" global
  nnoremap <leader>S :%s/\<<C-r><C-w>\>//g<left><left>
  
  vnoremap <leader>s :s/\<<C-r><C-w>\>//g<left><left>
" global
  vnoremap <leader>S :%s/\<<C-r><C-w>\>//g<left><left>
]])


-- for gtags
-- find functions calling this function
keymap("n", "<leader>U", ":cs find c <C-R>=expand('<cword>')<CR><CR>", opts)
-- find definition
keymap("n", "<leader>T", ":cs find g <C-R>=expand('<cword>')<CR><CR>", opts)



-- lsp 回调函数快捷键设置
  -- rename
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- code action
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- go xx
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

keymap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)





