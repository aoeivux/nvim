local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- Gruvbox-material
local palettes = { m = "material", x = "mix", o = "original" }
local backgrounds = { h = "hard", m = "medium", s = "soft" }
local modes = { l = "light", d = "dark" }

local M = {}
M.palette = palettes.m
M.background = backgrounds.s
M.mode = modes.d

o.background = M.mode
g.gruvbox_material_background = M.background
g.gruvbox_material_palette = M.palette

g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_enable_italic = 1
g.gruvbox_material_cursor = "auto"
g.gruvbox_material_transparent_background = 0
-- g.gruvbox_material_visual = "grey background"
-- g.gruvbox_material_selection_background = "grey"
g.gruvbox_material_sign_column_background = "none"
g.gruvbox_material_spell_foreground = "none"
g.gruvbox_material_ui_contrast = "low"
g.gruvbox_material_show_eob = 0
g.gruvbox_material_diagnostic_text_highlight = 0
g.gruvbox_material_diagnostic_line_highlight = 1
g.gruvbox_material_diagnostic_virtual_text = 1
g.gruvbox_material_current_word = "grey background"
g.gruvbox_material_disable_terminal_colors = 0
g.gruvbox_material_statusline_style = M.palette
g.gruvbox_material_lightline_disable_bold = 0

cmd("colorscheme gruvbox-material")

return M
