-- custom.configs.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local servers = { "html", "cssls", "clangd", "gopls", "pyright" }
local lspconfig = require "lspconfig"

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- For win jdtls
require "custom.configs.jdtls"
