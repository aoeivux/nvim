local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

-- friend snippets start
require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip").filetype_extend("lua", { "lua" })
-- require("luasnip").filetype_extend("js", { "js" })
-- require("luasnip").filetype_extend("cpp", { "cpp" })
-- require("luasnip").filetype_extend("python", { "python" })
-- require("luasnip").filetype_extend("latex", { "latex" })
-- require("luasnip").filetype_extend("org", { "org" })
-- require("luasnip").filetype_extend("r", { "r" })
-- require("luasnip").filetype_extend("shell", { "shell" })
-- require('luasnip').filetype_extend("dart", {"flutter"})
-- require 'luasnip'.filetype_extend("typescript", { "typescriptreact", "javascript", "javascriptreact" })
-- require 'luasnip'.filetype_extend("javasript", { "typescript", "javascriptreact" })
-- require("luasnip").filetype_extend("vue", { "html", "javascript", "css" })

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-w>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({select = true,}),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip'},
    { name = 'buffer' },
    { name = 'path' },
    
    {
      name = 'cmp-spell',
      options = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      }
    },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

