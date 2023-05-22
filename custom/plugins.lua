local actions = require "telescope.actions"
local cmp = require "cmp"

return {
  { "folke/which-key.nvim", enabled = true },
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      {
        -- code formatting, linting etc
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- opts overrides default plugin config's option
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
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
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
		commit = "8f392fa763b7ee80a48c714b630acaf6d1fe1854",
    lazy = true,
    opts = {
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
    },
  },
  -- Here we wrap opts with a function because its loading cmp module
  -- If we didnt wrap with function then the code will run on startup

  -- overrides as a function
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-h>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-h>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugins.configs.others").luasnip()
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
      },
    },
    opts = {
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-S-p>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<TAB>"] = cmp.mapping.confirm ({
          select = true,
        }),
      },
    },
  },
  {
    "kevinhwang91/rnvimr",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.plugins.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "Pocco81/TrueZen.nvim",
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
      vim.keymap.set({ "x", "o", "n" }, "f", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "x", "o", "n" }, "F", "<Plug>(leap-backward-to)")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
  },
}
