return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvimtree"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "configs.telescope"
    end,
  },

  -- can't use opts = require "config.cmp"
  -- because it can't lazy loading cmp while start up.
  -- write bleow opts = fun(parm1, parm2) at least 2 parm.
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = function()
      return require "configs.outline"
    end,
  },
}
