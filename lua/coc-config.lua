local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- short keymap name
local map = vim.api.nvim_set_keymap

vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

vim.g.coc_global_extensions = {
  'coc-css',
  'coc-diagnostic',
  'coc-flutter-tools',
  'coc-marketplace',
  'coc-html',
  'coc-json',
  'coc-lists', --Some basic list sources for coc.nvim
  'coc-prettier', -- Code format
  'coc-pyright',
  'coc-snippets',
  'coc-translator',
  'coc-tsserver',
  'coc-vetur',
  'coc-vimlsp',
  'coc-yaml',
  'coc-sumneko-lua',
  'coc-xml',
  'coc-go',
}


map("n", "<leader>ca", "<Plug>(coc-codeaction)", {})
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gh", ":call CocActionAsync('doHover')<CR>", opts)
map("n", "gr", "<Plug>(coc-references", opts)
map("n", "gi", "<Plug>(coc-implementation)", opts)
map("n", "gt", "<Plug>(coc-type-definition)", opts)
map("n", "<leader>rn", "<Plug>(coc-rename)", {})
map("n", "gk", "<Plug>(coc-diagnostic-prev)", opts)
map("n", "gj", "<Plug>(coc-diagnostic-next)", opts)


-- fit in css html js and so on
map("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", { noremap = true })
map("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", { noremap = true, silent = true, expr = true })
map("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", { noremap = true, expr = true })

-- translator
map("n", "<Leader>t", "<Plug>(coc-translator-p)", opts)
map("v", "<Leader>t", "<Plug>(coc-translator-pv)", opts)
