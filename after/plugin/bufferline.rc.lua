local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
vim.cmd [[set termguicolors]]
bufferline.setup({
  options = {
    numbers = "ordinal",
    mode = "buffers",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } }, -- | function , text_align = "left" | "center" | "right"}},
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      -- 0 => false | 1 => true
      bold = 1,
      italic = false,

    },
    fill = {
      bg = '#073642'
    }
  },
})
