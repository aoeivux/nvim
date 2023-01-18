local M = {}

M.zen = {
  n = {
    ["<leader>zf"] = { "<cmd> TZFocus <CR>", "tz focus" },
    ["<leader>zm"] = { "<cmd> TZMinimalist <CR>", "tz minimalits" },
    ["<leader>za"] = { "<cmd> TZAtaraxis <CR>", "tz ataraxis" },
  },
}

M.gernal = {
  n = {
    ["Q"] = { "<cmd> q! <CR>", "quit current file" },
  },
  v = {
    -- Stay in indent mode
    [">"] = { ">gv", "stay in indent" },
    ["<"] = { "<gv", "stay in indent" },
  },
}

M.rnvimr = {
  n = {
    [";ra"] = { "<cmd> RnvimrToggle <CR>", "Rnvimr File Manager Toggle" },
  },
}

M.dap = {
  n = {
    ["<F4>"] = { "<Cmd>lua require'dapui'.toggle()<CR>" },
    ["<F5>"] = { "<Cmd>lua require'dap'.continue()<CR>" },
    ["<F10>"] = { "<Cmd>lua require'dap'.step_over()<CR>" },
    ["<F11>"] = { "<Cmd>lua require'dap'.step_into()<CR>" },
    ["<F12>"] = { "<Cmd>lua require'dap'.step_out()<CR>" },
    [";b"] = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>" },
    [";B"] = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
    [";lp"] = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
    [";dr"] = { "<Cmd>lua require'dap'.repl.open()<CR>" },
    [";dl"] = { "<Cmd>lua require'dap'.run_last()<CR>" },
  },
}

return M
