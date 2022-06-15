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


-- quickly move
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)

keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)


-- quickly save && quit
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "S", ":w<CR>", opts)

-- FileExpoler

-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)
-- save buffer
keymap("n", "<leader>w", ":w<cr>", opts)

-- exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)

-- delete cur buffer
keymap("n", "<leader>d", ":bdelete<cr>", opts)


-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

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
