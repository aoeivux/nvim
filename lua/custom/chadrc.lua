local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
	theme_toggle = { "onedark", "one_light" },
	theme = "onedark",
	hl_override = highlights.override,
	hl_add = highlights.add,
	transparency = true,
	-- cmp themeing
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "atom",         -- default/flat_light/flat_dark/atom/atom_colored
		border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "colored", -- colored / simple
	},
	------------------------------- nvchad_ui modules -----------------------------
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "arrow",
		overriden_modules = nil,
	},
	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = true,
		overriden_modules = nil,
	},
	-- nvdash (dashboard)
	nvdash = {
		load_on_startup = true,
		header = {
			"           ▄ ▄                   ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		},
		buttons = {
			{ "  Find File",    "Spc f f", "Telescope find_files" },
			{ "  Recent Files", "Spc f o", "Telescope oldfiles" },
			{ "  Find Word",    "Spc f w", "Telescope live_grep" },
			{ "  Bookmarks",    "Spc b m", "Telescope marks" },
			{ "  Themes",       "Spc t f", "Telescope themes" },
		},
	},
	--备忘录
	cheatsheet = {
		theme = "grid", -- simple/grid
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
