local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"typescript",
		"javascript",
		"c",
		"vue",
		"java",
		"python",
		"go",
		"rust",
		"yaml",
	},
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"tailwindcss-language-server",
		"json-lsp",
		"deno",
		-- java web application
		"jdtls",
		-- go lsp
		"gopls",
		-- rust lsp
		"rust-analyzer",
		-- go debug
		"delve",
	},
}


-- nvimtree
M.nvimtree = {
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
				{ key = { "l", "<CR>", "o" }, action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "v", action = "vsplit" },
				{ key = "O", action = "cd" },
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "none",

		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
}

return M
