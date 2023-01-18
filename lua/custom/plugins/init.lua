local overrides = require "custom.plugins.overrides"

----------------------------------------- default and custom plugins configration ------------------------------------------
return {
  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    override_options = overrides.alpha,
  },

  ["Pocco81/TrueZen.nvim"] = {},

  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  ["ggandor/leap.nvim"] = {
    config = function()
      local ok, leap = pcall(require, "leap")

      if ok then
        leap.add_default_mappings()
      end
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["kevinhwang91/rnvimr"] = {},

  ["kylechui/nvim-surround"] = {
    after = "nvim-lspconfig",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    config = function ()
      require "custom.plugins.dap"
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("dapui").setup()
    end,
  }
}
