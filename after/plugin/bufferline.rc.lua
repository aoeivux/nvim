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
      guifg = '#073642',
      guibg = '#002b36',
    },
    separator_selected = {
      guifg = '#073642',
    },
    background = {
      guifg = '#657b83',
      guibg = '#002b36'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      -- 0 => false | 1 => true
      bold = 1,
      italic = false,

    },
    fill = {
      guibg = '#073642'
    }
  },
})
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
