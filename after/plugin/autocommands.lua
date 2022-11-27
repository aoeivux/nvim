--  folder bug
vim.cmd [[
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end
]]


-- I am trying to disable (auto-/omni-/whichever-) completion in sql. It is a problem for me because I used <C-c> for escape and when the file end in
vim.g.omni_sql_no_default_maps = 1
-- or below
-- vim.g.ftplugin_sql_omni_key = '<Plug>DisableSqlOmni'


