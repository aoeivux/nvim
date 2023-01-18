local status, saga = pcall(require, "lspsaga")
if (not status) then return end

local keymap = vim.keymap.set

saga.setup({
border_style = "single",
saga_winblend = 0,
move_in_saga = { prev = '<C-p>',next = '<C-n>'},
-- { "🙀", "😿", "😾", "😺" }
-- { "😡", "😥", "😤", "😐" }
diagnostic_header = { " ", " ", " ", "ﴞ " },
diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = 'o',
      quit = 'q',
      go_action = 'g'
    },
},
-- preview lines of lsp_finder and definition preview
max_preview_lines = 50,
-- use emoji lightbulb in default
code_action_icon = "💡",
-- if true can press number to execute the codeaction in codeaction window
code_action_num_shortcut = true,
code_action = {
	num_shortcut = true,
	keys = {
	-- string |table type
	quit = 'q',
	exec = '<CR>',
	},
},
-- same as nvim-lightbulb but async
code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
},
-- finder icons
finder_icons = {
  def = '  ',
  ref = '諭 ',
  link = '  ',
},
-- finder do lsp request timeout
-- if your project big enough or your server very slow
-- you may need to increase this value
finder_request_timeout = 1500,
finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
},
code_action_keys = {
    quit = "q",
    exec = "<CR>",
},
definition_action_keys = {
  edit = '<C-c>o',
  vsplit = '<C-c>v',
  split = '<C-c>i',
  tabe = '<C-c>t',
  quit = 'q',
},
rename = {
    quit = '<C-c>',
    exec = '<CR>',
    mark = 'x',
    confirm = '<CR>',
    in_select = true,
    whole_project = true,
},
rename_action_quit = "<C-c>",
rename_in_select = true,
symbol_in_winbar = {
    enable = true,
    separator = ' ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  -- show outline
  outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = 'o',
      expand_collapse = 'u',
      quit = 'q',
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = 'e',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      jump = 'o',
      quit = 'q',
      expand_collapse = 'u',
    },
  },
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
})


