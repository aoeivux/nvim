return {
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        c = { "clang_format" },
        sh = { "shfmt" },
        lua = { "stylua" },
        cpp = { "clang_format" },
        cmake = { "cmake_format" },
        python = { "autopep8" },
        javascript = { { "prettierd", "prettier" } },
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      -- Set up format-on-save
      format_on_save = nil,
      -- Customize formatters
      formatters = {

        injected = { options = { ignore_errors = true } },

        autopep8 = {
          prepend_args = { "--max-line-length", "100" },
        },
        clang_format = {
          prepend_args = {
            "--style",
            "{BasedOnStyle: LLVM, Standard: c++17, IndentWidth: 4}",
            -- "{BasedOnStyle: Google, Standard: c++17, ColumnLimit: 100, IndentWidth: 4}",
          },
          -- command = "clang-format",
          -- args = { "-style=file:/usr/local/src/config/.clang-format" },
        },
        stylua = {
          prepend_args = { "--column-width", "100", "--indent-type", "Spaces" },
        },
        shfmt = {
          prepend_args = { "-i", "4" },
        },
      },
    }
    return opts
  end,
}
