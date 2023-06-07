local on_attach = require("aoeivux.lsp.lspconfig").on_attach
local capabilities = require("aoeivux.lsp.lspconfig").capabilities

local servers = { "html", "cssls", "clangd", "gopls", "pyright" }
local lspconfig = require "lspconfig"

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- For win jdtls
require "aoeivux.lsp.jdtls"

-- LSP 进度UI
require("fidget")

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
