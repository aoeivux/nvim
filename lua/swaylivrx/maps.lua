local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local bufopts = { noremap=true, silent=true, buffer=bufnr }

vim.g.mapleader = " "
vim.g.maplocalleader = " "


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
keymap("n", "<C-s>", ":w<CR>", opts)


-- no highlight
keymap("n", ";l", ":nohl<cr>", opts)
-- save buffer
keymap("n", ";w", ":w<cr>", opts)
-- delete cur buffer
keymap("n", ";d", ":bdelete<cr>", opts)



-- Navigate buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Navigate line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)



-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------



-- latest maps
local keymap = vim.keymap.set

-- lsp saga
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
-- Callhierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
-- Float terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- Only Error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })




-- don's paste detele words
keymap('n', 'x', '"_x')
keymap('v', 'x', '"_x')
keymap('n', 'c', '"_c')
keymap('v', 'c', '"_c')
-- Incnt/decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Reswindow
keymap('n', '<A-left>', '<C-w>3<')
keymap('n', '<A-right>', '<C-w>3>')
keymap('n', '<A-up>', '<C-w>3+')
keymap('n', '<A-down>', '<C-w>3-')

keymap("n", '<Bslash>','<cmd> TbufPick <CR>')
keymap("n", '<leader>x','<cmd> bdelelte <CR>')
keymap("n", '<M-1>', '<cmd> NvimTreeFocus <CR>')
keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
keymap('n', '<space>wl', function()print(vim.inspect(vim.lsp.buf.list_workspace_folders()))end, bufopts)