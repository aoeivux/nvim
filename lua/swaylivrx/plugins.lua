local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons" -- icons

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "norcalli/nvim-colorizer.lua"
  -- neovim lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind.nvim'


  -- Editor enhance
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "terrortylor/nvim-comment"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets pluginc
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use 'f3fora/cmp-spell'
  use 'rafamadriz/friendly-snippets' -- Snippets collection for a set of different programming languages for faster development.
  
  use "tpope/vim-surround" -- vim surround

  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file

  use "folke/which-key.nvim" -- which  key

  use {"kyazdani42/nvim-tree.lua",branch = "1406-allow-folder_arrow"}

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "nvim-lualine/lualine.nvim" -- status line
  use 'lukas-reineke/indent-blankline.nvim'
  -- use 'sheerun/vim-polyglot' -- 解决了在html嵌入javascript代码缩进错误的问题
  --
  use 'mhinz/vim-startify' --start up ui
  use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' } --code runner
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'sainnhe/gruvbox-material'
  
  use 'mfussenegger/nvim-jdtls' -- java lsp 

  use({'scalameta/nvim-metals',requires = { "nvim-lua/plenary.nvim" }}) -- scala lsp

  use 'mg979/vim-visual-multi'

  use 'ggandor/leap.nvim'

  use "nvim-telescope/telescope-live-grep-args.nvim"

  

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
