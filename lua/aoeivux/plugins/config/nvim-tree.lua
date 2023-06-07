local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local status, api = pcall(require, "nvim-tree.api")
  if (not status) then 
    print("not api")
  end
  
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'h',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))
end

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	-- auto_close          = true,
	auto_reload_on_write = true,
	open_on_tab = false,
	hijack_cursor = true,
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "dbui", "dbout" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = "",
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$" },
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	view = {
		width = 34,
		-- height = 40,
		side = "left",
		hide_root_folder = false,
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		root_folder_label = false,
		indent_markers = {
			enable = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})

-- local g = vim.g

-- g.nvim_tree_icons = {
--    default = "",
--    symlink = "",
--    git = {
--       deleted = "",
--       ignored = "◌",
--       renamed = "➜",
--       staged = "✓",
--       unmerged = "",
--       unstaged = "✗",
--       untracked = "★",
--    },
--    folder = {
--       default = "",
--       empty = "",
--       empty_open = "",
--       open = "",
--       symlink = "",
--       symlink_open = "",
--    },
-- }
