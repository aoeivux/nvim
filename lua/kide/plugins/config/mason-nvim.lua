require("mason").setup({
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		-- "typescript-language-server",
		-- "tailwindcss-language-server",
		-- "json-lsp",
		-- "deno",
		-- java web application
		"jdtls",
		-- python,
		"pyright",
		-- go lsp
		"gopls",
		-- rust lsp
		-- "rust-analyzer",
		-- go debug
		"delve",
	},
})
