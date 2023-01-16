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
    ["Q"] = {"cmd :q! <CR>", "quit current file"},
  }
}


return M
