local config = require("aoeivux.config")

require("lazy").setup({

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("aoeivux.lsp.mason")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
    opts = function ()
        return require("aoeivux.lsp.mason-lspconfig")
    end,
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})
      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufNewFile", "BufReadPost" },
    config = function()
      require("aoeivux.lsp")
    end,
  },

  -- 代码片段
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },
  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("aoeivux.plugins.config.luasnip")
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = { "L3MON4D3/LuaSnip" },
    lazy = true,
  },
  -- lspkind
  {
    "onsails/lspkind-nvim",
    lazy = true,
    event = { "VeryLazy" },
    config = function()
      require("lspkind").init({
        -- preset = "codicons",
        symbol_map = {
          Copilot = "",
        },
      })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
    end,
  },
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "VeryLazy" },
    keys = { ":", "/", "?" },
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
    lazy = true,
    config = function()
      require("aoeivux.plugins.config.nvim-cmp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
  {
    "hrsh7th/cmp-path",
    lazy = true,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    -- event = { "BufNewFile", "BufReadPost" },
    config = function()
      require("aoeivux.plugins.config.null-ls")
    end,
  },

  -- 主题
  -- use 'morhetz/gruvbox'
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require("aoeivux.plugins.config.gruvbox")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- require("aoeivux.plugins.config.gruvbox")

      vim.opt.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = true
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },

  -- 文件管理
  {
    "kyazdani42/nvim-tree.lua",
    lazy = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    version = "*",
    config = function()
      require("aoeivux.plugins.config.nvim-tree")
    end,
  },

  -- using packer.nvim
  {
    "akinsho/bufferline.nvim",
    version = "*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("aoeivux.plugins.config.bufferline")
    end,
  },

  -- treesitter (新增)
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require("aoeivux.plugins.config.nvim-treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufNewFile", "BufReadPost" },
  },

  -- java
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
  },
  -- debug
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = { "VeryLazy" },
    config = function()
      require("aoeivux.dap")
      -- require("telescope").load_extension("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    event = { "VeryLazy" },
    config = function()
      require("aoeivux.plugins.config.nvim-dap-ui")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    event = { "VeryLazy" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    ft = "java",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup(config.env.py_bin)
    end,
  },

  -- 搜索插件
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = { "VeryLazy" },
    cmd = { "Telescope" },
    keys = { "<leader>" },
    tag = "0.1.1",
    config = function()
      require("aoeivux.plugins.config.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
  },

  {
    "LinArcX/telescope-env.nvim",
    lazy = true,
  },
  -- 项目管理
  {
    "nvim-telescope/telescope-project.nvim",
    lazy = true,
  },

  -- git
  {
    "tpope/vim-fugitive",
    layz = true,
    cmd = { "Git" },
  },
  {
    "sindrets/diffview.nvim",
    layz = true,
    cmd = {
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    config = function()
      require("aoeivux.plugins.config.diffview-nvim")
    end,
  },
  {
    "TimUntersberger/neogit",
    layz = true,
    cmd = "Neogit",
    dependencies = { "sindrets/diffview.nvim" },
    config = function()
      require("aoeivux.plugins.config.neogit")
    end,
  },

  -- git edit 状态显示插件
  {
    "lewis6991/gitsigns.nvim",
    layz = true,
    event = { "VeryLazy", "BufReadPost" },
    config = function()
      require("aoeivux.plugins.config.gitsigns-nvim")
    end,
  },
  -- 多光标插件
  {
    "mg979/vim-visual-multi",
    lazy = true,
    keys = {
      { "<C-n>", mode = { "n", "x" }, desc = "visual multi" },
    },
  },

  -- 状态栏插件
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("aoeivux.plugins.config.lualine")
    end,
  },

  -- blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost" },
    config = function()
      require("aoeivux.plugins.config.indent-blankline")
    end,
  },

  -- 大纲插件
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    config = function()
      require("aoeivux.plugins.config.symbols-outline")
    end,
  },

  -- wildmenu 补全美化
  {
    "gelguy/wilder.nvim",
    enabled = false,
    keys = { ":", "/", "?" },
    config = function()
      require("aoeivux.plugins.config.wilder")
    end,
  },

  -- 颜色显示
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "InsertEnter", "VeryLazy" },
    config = function()
      require("aoeivux.plugins.config.nvim-colorizer")
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = { "n" }, desc = "Comment" },
      { "gc", mode = { "x" }, desc = "Comment" },
    },
    config = function()
      require("aoeivux.plugins.config.comment")
    end,
  },
  {
    "danymat/neogen",
    lazy = true,
    event = { "VeryLazy" },
    config = function()
      require("aoeivux.plugins.config.neogen")
    end,
  },

  -- mackdown 预览插件
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    build = "cd app && yarn install",
    config = function()
      require("aoeivux.plugins.config.markdown-preview")
    end,
  },
  -- mackdown cli 预览插件
  {
    "ellisonleao/glow.nvim",
    lazy = true,
    ft = "markdown",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 120,
      })
    end,
  },
  -- 快捷键查看
  {
    "folke/which-key.nvim",
    lazy = true,
    event = { "VeryLazy" },
    config = function()
      require("aoeivux.plugins.config.which-key")
    end,
  },

  -- 仪表盘
  {
    "goolord/alpha-nvim",
    config = function()
      require("aoeivux.plugins.config.alpha-nvim")
    end,
  },
  -- 自动对齐插件
  {
    "junegunn/vim-easy-align",
    lazy = true,
    cmd = "EasyAlign",
    config = function()
      require("aoeivux.core.keybindings").easy_align()
    end,
  },

  -- 表格模式插件
  {
    "dhruvasagar/vim-table-mode",
    lazy = true,
    cmd = { "TableModeEnable" },
  },

  -- () 自动补全
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "VeryLazy" },
    config = function()
      require("aoeivux.plugins.config.nvim-autopairs")
    end,
  },

  {
    "itchyny/calendar.vim",
    lazy = true,
    cmd = {
      "Calendar",
    },
  },
  -- 选中高亮插件
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost" },
    config = function()
      require("aoeivux.plugins.config.vim-illuminate")
    end,
  },

  -- 快速跳转
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
      vim.keymap.set({ "x", "o", "n" }, "f", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "x", "o", "n" }, "F", "<Plug>(leap-backward-to)")
    end,
  },

  -- LSP 进度
  {
    "j-hui/fidget.nvim",
    tag = "legacy", -- NOTE: fidget.nvim will soon be completely rewritten. In the meantime, please pin your plugin config to the legacy tag to avoid breaking changes.
    lazy = true,
    config = function()
      require("fidget").setup({
        text = {
          done = "",
        },
      })
    end,
  },

  -- 查找替换
  {
    "windwp/nvim-spectre",
    lazy = true,
    config = function()
      require("spectre").setup()
    end,
  },

  -- ASCII 图
  {
    "jbyuki/venn.nvim",
    lazy = true,
    cmd = { "VBox" },
  },

  {
    "tversteeg/registers.nvim",
    lazy = true,
    cmd = { "Registers" },
    keys = '"',
    config = function()
      require("registers").setup()
    end,
  },

  -- databases
  {
    "nanotee/sqls.nvim",
    lazy = true,
    ft = { "sql", "mysql" },
  },
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    lazy = true,
    dependencies = { "tpope/vim-dadbod" },
    cmd = {
      "DBUI",
      "DBUIToggle",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "aklt/plantuml-syntax",
    lazy = true,
    ft = "plantuml",
  },

  -- 环绕输入
  {
    "kylechui/nvim-surround",
    lazy = true,
    version = "*",
    event = { "VeryLazy" },
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  --  Create custom submodes and menus
  {
    "anuvyklack/hydra.nvim",
    lazy = true,
  },

  -- 代码状态栏导航
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    config = function()
      require("aoeivux.plugins.config.nvim-navic")
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    config = function()
      require("todo-comments").setup({})
    end,
  },
}, {
  ui = {
    icons = {
      task = " ",
    },
  },
})
