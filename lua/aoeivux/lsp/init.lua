local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
  },
})

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local server_configs = {
  lua_ls = require("aoeivux.lsp.lua_ls"), -- /lua/lsp/lua.lua
  jdtls = require("aoeivux.lsp.java"), -- /lua/lsp/jdtls.lua
  metals = require("aoeivux.lsp.metals"), -- /lua/lsp/jdtls.lua
  -- jsonls = require("lsp.jsonls"),
  clangd = require("aoeivux.lsp.clangd"),
  tsserver = require("aoeivux.lsp.tsserver"),
  html = require("aoeivux.lsp.html"),
  pyright = require("aoeivux.lsp.pyright"),
  rust_analyzer = require("aoeivux.lsp.rust_analyzer"),
  sqlls = require("aoeivux.lsp.sqlls"),
  gopls = require("aoeivux.lsp.gopls"),
  kotlin_language_server = {},
  vuels = {},
  lemminx = require("aoeivux.lsp.lemminx"),
  gdscript = require("aoeivux.lsp.gdscript"),
}

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 没有确定使用效果参数
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local utils = require("aoeivux.core.utils")

-- LSP 进度UI
require("fidget")
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    local lspconfig = require("lspconfig")
    -- tools config
    local cfg = utils.or_default(server_configs[server_name], {})
    -- 自定义启动方式
    if cfg.setup then
      return
    end

    -- lspconfig
    local scfg = utils.or_default(cfg.server, {})
    -- scfg = vim.tbl_deep_extend("force", server:get_default_options(), scfg)
    local on_attach = scfg.on_attach
    scfg.on_attach = function(client, buffer)
      -- 绑定快捷键
      require("aoeivux.core.keybindings").maplsp(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer)
      end
      if on_attach then
        on_attach(client, buffer)
      end
    end
    scfg.flags = {
      debounce_text_changes = 150,
    }
    scfg.capabilities = capabilities
    lspconfig[server_name].setup(scfg)
  end,
})

for _, value in pairs(server_configs) do
  if value.setup then
    value.setup({
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
      on_attach = function(client, buffer)
        -- 绑定快捷键
        require("aoeivux.core.keybindings").maplsp(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end,
    })
  end
end

-- LSP 相关美化参考 https://github.com/NvChad/NvChad
local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

local lsp_ui = require("aoeivux.lsp.lsp_ui")
lspSymbol("Error", lsp_ui.diagnostics.icons.error)
lspSymbol("Info", lsp_ui.diagnostics.icons.info)
lspSymbol("Hint", lsp_ui.diagnostics.icons.hint)
lspSymbol("Warn", lsp_ui.diagnostics.icons.warning)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_ui.hover_actions)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_ui.hover_actions)
