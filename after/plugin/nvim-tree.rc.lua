local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  view = {
    width = 33,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "p", action = "preview" },
        { key = "O", action = "cd" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
)



  -- view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
  -- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  --   { key = "<C-e>",                          action = "edit_in_place" },
  --   { key = "O",                              action = "edit_no_picker" },
  --   { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
  --   { key = "<C-v>",                          action = "vsplit" },
  --   { key = "<C-x>",                          action = "split" },
  --   { key = "<C-t>",                          action = "tabnew" },
  --   { key = "<",                              action = "prev_sibling" },
  --   { key = ">",                              action = "next_sibling" },
  --   { key = "P",                              action = "parent_node" },
  --   { key = "<BS>",                           action = "close_node" },
  --   { key = "<Tab>",                          action = "preview" },
  --   { key = "K",                              action = "first_sibling" },
  --   { key = "J",                              action = "last_sibling" },
  --   { key = "C",                              action = "toggle_git_clean" },
  --   { key = "I",                              action = "toggle_git_ignored" },
  --   { key = "H",                              action = "toggle_dotfiles" },
  --   { key = "B",                              action = "toggle_no_buffer" },
  --   { key = "U",                              action = "toggle_custom" },
  --   { key = "R",                              action = "refresh" },
  --   { key = "a",                              action = "create" },
  --   { key = "d",                              action = "remove" },
  --   { key = "D",                              action = "trash" },
  --   { key = "r",                              action = "rename" },
  --   { key = "<C-r>",                          action = "full_rename" },
  --   { key = "e",                              action = "rename_basename" },
  --   { key = "x",                              action = "cut" },
  --   { key = "c",                              action = "copy" },
  --   { key = "p",                              action = "paste" },
  --   { key = "y",                              action = "copy_name" },
  --   { key = "Y",                              action = "copy_path" },
  --   { key = "gy",                             action = "copy_absolute_path" },
  --   { key = "[e",                             action = "prev_diag_item" },
  --   { key = "[c",                             action = "prev_git_item" },
  --   { key = "]e",                             action = "next_diag_item" },
  --   { key = "]c",                             action = "next_git_item" },
  --   { key = "-",                              action = "dir_up" },
  --   { key = "s",                              action = "system_open" },
  --   { key = "f",                              action = "live_filter" },
  --   { key = "F",                              action = "clear_live_filter" },
  --   { key = "q",                              action = "close" },
  --   { key = "W",                              action = "collapse_all" },
  --   { key = "E",                              action = "expand_all" },
  --   { key = "S",                              action = "search_node" },
  --   { key = ".",                              action = "run_file_command" },
  --   { key = "<C-k>",                          action = "toggle_file_info" },
  --   { key = "g?",                             action = "toggle_help" },
  --   { key = "m",                              action = "toggle_mark" },
  --   { key = "bmv",                            action = "bulk_move" },
  -- } -- END_DEFAULT_MAPPINGS
