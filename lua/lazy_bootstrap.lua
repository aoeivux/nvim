local api = vim.api
local opt_local = vim.opt_local
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
require "aoeivux.core.post_bootstrap"()
vim.opt.rtp:prepend(lazypath)
