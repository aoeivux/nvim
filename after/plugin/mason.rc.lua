local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
	ensure_installed = {
		-- lua stuff
		"lua-language-server",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"json-lsp",
		"tailwindcss-language-server",
		-- java web application
		"jdtls",
		-- golang
		"gopls",
		"delve", -- debug
		-- rust
		"rust-analyzer",
	},
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	}
})

lspconfig.setup {
	ensure_installed = {
	},
}
