local keymap = vim.api.nvim_set_keymap
local expr_opts = { noremap = true, silent = true, expr = true }
local opts = { noremap = true, silent = true }

-- Extensions
vim.g["coc_global_extensions"] = {
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
  'coc-go',
  'coc-emmet',
}

-- highlight
-- for custom pop menu
vim.highlight.create("CocCustomPopup", { guifg = "#ebdbb2", guibg = "#282828" })
-- border
vim.highlight.create("CocCustomPopupBoder", { guifg = "#5F5F5F", gui = "bold" })
-- selected row
vim.highlight.create("CocMenuSel", { guibg = "#3c3836", gui = "bold" })
-- matched_text
vim.highlight.create("CocSearch", { guifg = "#fabd2f" })

-- AutoCmds
-- highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd("CursorHold", { pattern = '*', command = [[call CocActionAsync("highlight")]] })

-- key mappings
-- toggle diagnostics
keymap("n", "gt", ":call CocAction('diagnosticToggle')<CR>", {})

-- use CTRL-J and K to move on snippets and auto completion
vim.g["coc_snippet_next"] = ""
vim.g["coc_snippet_prev"] = ""
keymap(
  "i",
  "<c-j>",
  [[coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" : "\<c-j>"]]
  ,
  expr_opts
)
keymap(
  "i",
  "<c-k>",
  [[coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" : "\<c-k>"]]
  ,
  expr_opts
)

-- use CR to complete
keymap(
  "i",
  "<CR>",
  [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  expr_opts
)

-- Use gh to show documentation in preview window.
function Show_documentation()
  local filetype = vim.bo.filetype
  if filetype == "vim" or filetype == "help" then
    vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
  elseif vim.fn["coc#rpc#ready"]() then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command(
      "!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
    )
  end
end

-- TAB for completion
-- vim.cmd [[inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"]]
keymap("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"]], { silent = true, expr = true })
-- use <c-space> to trigger completion.
keymap("i", "<c-space>", [[coc#refresh()]], expr_opts)
-- navigate diagnostic
keymap("n", "gk", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap("n", "gj", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation.
keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap("n", "gs", ":call CocAction('jumpDefinition', 'vsplit') <CR>", { silent = true })
keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap("n", "gr", "<Plug>(coc-references)", { silent = true })
keymap("n", "<leader>ca", "<Plug>(coc-codeaction)", {})


keymap("n", "gh", ":lua Show_documentation() <CR>", opts)

-- Symbol renaming.
keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- " Formatting selected code. Followed by highlighted code
keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {})

-- " Mappings for CoCList
-- " Show all diagnostics (Errors and warnings).
keymap("n", "<leader>a", ":<C-u>CocList diagnostics<CR>", opts)
-- " Find symbol of current document
keymap("n", "<leader>o", ":<C-u>CocList outline<CR>", opts)
