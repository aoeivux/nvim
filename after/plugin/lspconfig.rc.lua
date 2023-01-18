-- custom.plugins.lspconfig
local on_attach = require("lspdir.lspconfig").on_attach
local capabilities = require("lspdir.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "jsonls", "tsserver", "tailwindcss", "jdtls", "gopls", "rust_analyzer" }


for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
