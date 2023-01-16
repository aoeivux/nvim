local overrides = require "custom.plugins.overrides"

----------------------------------------- default and custom plugins configration ------------------------------------------
return {
  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
    override_options = overrides.alpha,
  },

  ["Pocco81/TrueZen.nvim"] = {},

  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  ["ggandor/leap.nvim"] = {
    config = function ()
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

}
