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

--macos open this file in browser
-- keymap("n", "<F5>", ":!open -a Microsoft\\ Edge %<CR><CR>", opts)
-- keymap("n", "<F5>", ":!open -a Safari %<CR><CR>", opts)
keymap("n", "<F5>", ":!open -a min %<CR><CR>", opts)

-- open current url in default browser
vim.cmd [[
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <F7> :call HandleURI()<CR>
]]


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


-- latest maps
local keymap = vim.keymap

-- New tab
keymap.set('n', 'te', ':tabedit')

--rename buffer
-- file + yourname

-- don's paste detele words
keymap.set('n', 'x', '"_x')
keymap.set('v', 'x', '"_x')
keymap.set('n', 'c', '"_c')
keymap.set('v', 'c', '"_c')
-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w>3<')
keymap.set('n', '<C-w><right>', '<C-w>3>')
keymap.set('n', '<C-w><up>', '<C-w>3+')
keymap.set('n', '<C-w><down>', '<C-w>3-')
