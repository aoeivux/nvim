-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 
---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvbox",
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

    nvdash = {
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
        load_on_startup = true,
        -- stylua: ignore
        buttons = {{"  Find File", "Spc f f", "Telescope find_files"},
                   {"  Bookmarks", "Spc m a", "Telescope marks"},
                   {"  Live Grep", "Spc f w", "Telescope live_grep"},
                   {"󰈚  Recent Files", "Spc f r", "Telescope oldfiles"},
                   {"  Themes", "Spc t h", "Telescope themes"}, {"  Mappings", "Spc c h", "NvCheatsheet"}}
    }
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
    pkgs = {"clangd"}
}

return M
