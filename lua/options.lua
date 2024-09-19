require "nvchad.options"

local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.shell = "pwsh.exe"

opt.termguicolors = true
opt.swapfile = false

