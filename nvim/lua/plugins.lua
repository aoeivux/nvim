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
if not status_ok then
  return
end


-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons" -- icons

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "nvim-0.6",
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-raw.nvim"
  --
  -- Treesittetr
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "44b7c8100269161e20d585f24bce322f6dcdf8d2",
   }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  }


  -- coc.nvim 
  use {'neoclide/coc.nvim', branch = 'release'}


  -- Editor enhance
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "terrortylor/nvim-comment"

  -- cmp plugins
  use {"hrsh7th/nvim-cmp",} 
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "ray-x/cmp-treesitter"
  use "f3fora/cmp-spell" -- spell check


  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file
  use "nvim-pack/nvim-spectre" -- search and replace pane
  use "tpope/vim-repeat" --  . command enhance
  use "tpope/vim-surround" -- vim surround


  use "akinsho/toggleterm.nvim" -- toggle terminal
  use "ahmedkhalf/project.nvim" -- project manager
  use "lukas-reineke/indent-blankline.nvim" -- indent blankline
  use "folke/which-key.nvim" -- which  key
  use {
    "phaazon/hop.nvim", -- like easymotion, but more powerful
    branch = "v1", -- optional but strongly recommended
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    tag = "v0.4",
  }

  -- UI
  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "sainnhe/everforest"


  use {
    "kyazdani42/nvim-tree.lua",
    tag = "nightly",
    -- file explore
  }

  use {
    "akinsho/bufferline.nvim", -- tab
    tag = "v1.2.0",
  }
  use "nvim-lualine/lualine.nvim" -- status line
  use "goolord/alpha-nvim" -- welcome page
  use "stevearc/aerial.nvim" -- outline
  use "norcalli/nvim-colorizer.lua" -- show color
  use "folke/trouble.nvim"  -- errors and warnings 
  use "j-hui/fidget.nvim" -- show lsp progress
  use "sindrets/winshift.nvim" -- rerange window layout

  use { 'michaelb/sniprun',
      run = 'bash ./install.sh',
      commit = '57fcdc58c443f13d14889bc58c59e2494877509a',
    }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
