require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del
-- local opt = { noremap = true, silent = true }


unmap("i", "<C-j>")
unmap("i", "<C-k>")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- -- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<M-1>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find recent files" })

-- 取消搜索高亮显示
map("n", ";l", ":nohlsearch<CR>")

-- Split window
map("n", "sv", ":split<Return>")
-- test
map("n", "ss", ":vsplit<Return>")

-- 快速移动
map("n", "K", "7k")
map("n", "J", "7j")
map("v", "J", "7j")
map("v", "K", "7k")

map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$h")

map("v", ">", ">gv")
map("v", "<", "<gv")

-- quick quit and save
map("n", "S", ":w<CR>")
map("n", "Q", ":q<CR>")