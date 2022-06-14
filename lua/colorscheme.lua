vim.opt.background = "dark"
vim.cmd [[autocmd vimenter * highlight Normal guibg=NONE ctermbg=NONE]]
vim.gruvbox_transparent_bg = 1
local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " not found！")
  return
end
