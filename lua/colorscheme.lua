
vim.g.everforest_better_performance = 1
vim.g.everforest_background = 'soft'
vim.g.everforest_transparent_background=1
local colorscheme = "everforest"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end

