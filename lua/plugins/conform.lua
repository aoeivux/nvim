return {
  "stevearc/conform.nvim",
  formatters_by_ft = {
    cpp = { "clang_format" },
  },
  formatters = {
    clang_format = {
      prepend_args = { '-style="{IndentWidth: 4}"' },
    },
  },
}
