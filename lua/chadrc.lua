-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 
---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "solarized_osaka",
    -- hl_override = {},
    -- hl_add = {},
    -- below default
    -- integrations = {},
    -- changed_themes = {},
    transparency = false,
    -- theme_toggle = { "onedark", "one_light" },
}

M.ui = {

    cmp = {
        icons = true,
        lspkind_text = true,
        style = "atom" -- default/flat_light/flat_dark/atom/atom_colored
    },

    telescope = {
        style = "borderless"
    }, -- borderless / bordered

    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        order = nil,
        modules = nil
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
        enabled = true,
        lazyload = true,
        order = {"treeOffset", "buffers", "tabs", "btns"},
        modules = nil
    },

}

M.nvdash = {
        load_on_startup = true,
        header = {"⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕",
                  "⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕",
                  "⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱",
                  "⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀",
                  "⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗",
                  "⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕",
                  "⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵",
                  "⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                  "⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿",
                  "⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁", "",
                  "Hello, master!"},
        -- stylua: ignore
        buttons = {{txt = "  Find File", key = "Spc f f", cmd = "Telescope find_files"},
                   {txt = "  Bookmarks", key = "Spc m a", cmd = "Telescope marks"},
                   {txt = "  Live Grep", key = "Spc f w", cmd = "Telescope live_grep"},
                   {txt = "󰈚  Recent Files", key = "Spc f r", cmd = "Telescope oldfiles"},
                   {txt = "  Themes", key = "Spc t h", "Telescope themes"},
                   {txt = "  Mappings", key = "Spc c h", cmd = "NvCheatsheet"}}
}


M.term = {
    winopts = {
        number = false,
        relativenumber = false
    },
    sizes = {
        sp = 0.3,
        vsp = 0.2,
        ["bo sp"] = 0.3,
        ["bo vsp"] = 0.2
    },
    float = {
        relative = "editor",
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single"
    }
}

M.lsp = {
    signature = true
}

M.cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = {"terminal (t)", "autopairs", "Nvim", "Opens"} -- can add group name or with mode
}

M.mason = {
    cmd = true,
    pkgs = {"typescript-language-server", "pyright"}
}

return M
