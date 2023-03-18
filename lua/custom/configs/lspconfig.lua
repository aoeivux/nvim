-- custom.configs.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local servers = { "html", "cssls", "clangd", "jsonls", "tsserver", "tailwindcss", "jdtls", "gopls", "rust_analyzer" }
local lspconfig = require "lspconfig"

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end


