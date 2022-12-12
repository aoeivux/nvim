local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } }, -- | function , text_align = "left" | "center" | "right"}},
    indicator = {
      style="underline"
    }
  },
})

