local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["q:"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  v = {
    ["q:"] = "",
  },
}

M.general = {
  n = {
    ["q:"] = { "<Nop>", "Forbid command line mode" },
    ["Q"] = { "<cmd> q! <CR>", "quit current file" },
    ["H"] = { "^", "head of line" },
    ["L"] = { "$", "tail of line" },
    ["J"] = { "6j", "quick move 6 line down" },
    ["K"] = { "6k", "quick move 6 line up" },
    ["<M-1>"] = { "<cmd> NvimTreeFocus <CR>", "toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["S"] = { "<cmd> w! <CR>", "Save current file" },
    -- Reswindow
    ["<M-left>"] = { "<C-w>3<" },
    ["<M-right>"] = { "<C-w>3>" },
    ["<M-up>"] = { "<C-w>3+" },
    ["<M-down>"] = { "<C-w>3-" },
  },
  v = {
    ["q:"] = { "<Nop>", "Forbid command line mode" },
    -- Stay in indent mode
    [">"] = { ">gv", "stay in indent" },
    ["<"] = { "<gv", "stay in indent" },
    ["J"] = { "6j", "quick move 6 line down" },
    ["K"] = { "6k", "quick move 6 line up" },
    ["H"] = { "^", "head of line" },
    ["L"] = { "$", "tail of line" },
    ["<M-1>"] = { "<cmd> NvimTreeFocus <CR>", "toggle nvimtree" },
  },
  i = {
    ["<M-1>"] = { "<cmd> NvimTreeFocus <CR>", "toggle nvimtree" },
  },
}

M.rnvimr = {
  n = {
    [";ra"] = { "<cmd> RnvimrToggle <CR>", "Rnvimr File Manager Toggle" },
    -- \ 'gw': 'JumpNvimCwd',
    -- \ 'yw': 'EmitRangerCwd'
  },
}


M.dap = {
  n = {
    ["<F4>"] = { "<Cmd>lua require'dapui'.toggle()<CR>" },
    ["<F5>"] = { "<Cmd>lua require'dap'.continue()<CR>" },
    ["<F10>"] = { "<Cmd>lua require'dap'.step_over()<CR>" },
    ["<F11>"] = { "<Cmd>lua require'dap'.step_into()<CR>" },
    ["<F12>"] = { "<Cmd>lua require'dap'.step_out()<CR>" },
    [";b"] = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>" },
    [";B"] = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
    [";lp"] = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
    [";dr"] = { "<Cmd>lua require'dap'.repl.open()<CR>" },
    [";dl"] = { "<Cmd>lua require'dap'.run_last()<CR>" },
  },
}

M.zen = {
  n = {
    ["<leader>zf"] = { "<cmd> TZFocus <CR>", "tz focus" },
    ["<leader>zm"] = { "<cmd> TZMinimalist <CR>", "tz minimalits" },
    ["<leader>za"] = { "<cmd> TZAtaraxis <CR>", "tz ataraxis" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["[e"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["]e"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}
return M
