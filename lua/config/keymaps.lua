-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local M = {}
local keymap = vim.keymap
local opt = { noremap = true, silent = true }

-- -- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- bufferline.nvim
keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opt)
keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opt)
keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opt)
keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opt)
keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opt)

-- 取消搜索高亮显示
keymap.set("n", ";l", ":nohlsearch<CR>", opt)

-- Split window
keymap.set("n", "sv", ":split<Return>", opt)
-- test
keymap.set("n", "ss", ":vsplit<Return>", opt)

-- 快速移动
keymap.set("n", "K", "7k", opt)
keymap.set("n", "J", "7j", opt)
keymap.set("v", "J", "7j", opt)
keymap.set("v", "K", "7k", opt)

keymap.set("n", "H", "^", opt)
keymap.set("n", "L", "$", opt)
keymap.set("v", "H", "^", opt)
keymap.set("v", "L", "$", opt)

keymap.set("v", ">", ">gv", opt)
keymap.set("v", "<", "<gv", opt)

-- quick quit and save
keymap.set("n", "S", ":w<CR>", opt)
keymap.set("n", "Q", ":q<CR>", opt)

-- change tab
keymap.set("n", "<TAB>", ":BufferLineCycleNext <CR>", opt)
keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", opt)

-- toggle neotree
keymap.set("n", "<M-1>", "<Cmd>Neotree toggle<CR>", opt)
