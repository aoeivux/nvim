local M = {}

M.zen = {
  n = {
    ["<leader>zf"] = { "<cmd> TZFocus <CR>", "tz focus" },
    ["<leader>zm"] = { "<cmd> TZMinimalist <CR>", "tz minimalits" },
    ["<leader>za"] = { "<cmd> TZAtaraxis <CR>", "tz ataraxis" },
  }
}

M.gernal = {
  n = {
    ["Q"] = {"<cmd> q! <CR>", "quit current file"},
  },
  v = {
    -- Stay in indent mode
    [">"] = {">gv", "stay in indent"},
    ["<"] = {"<gv", "stay in indent"},
  }
}

M.rnvimr = {
  n = {
    [";ra"] = {"<cmd> RnvimrToggle <CR>", "Rnvimr File Manager Toggle"}
  }
}

return M
