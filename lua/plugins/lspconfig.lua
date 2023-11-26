return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- keys[#keys + 1] = { "<leader>ca", false }
    -- keys[#keys + 1] = { "]d", false }
    -- keys[#keys + 1] = { "[d]", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover" }
  end,

  -- opts = function(_, opts)
  --   opts.autoformat = false
  -- end,
}
