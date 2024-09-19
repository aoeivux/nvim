-- Set font styles
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Comment
    vim.cmd('hi Comment gui=italic')
    -- Keyword
    vim.cmd('hi Keyword gui=bold')
    -- Variable
    vim.cmd('hi Variable gui=italic')
    -- Function
    vim.cmd('hi Function gui=italic')
    -- Number
    vim.cmd('hi Number gui=italic')
    -- Type
    vim.cmd('hi Type gui=bold')
  end
})


-- Opening nvim-tree At Neovim Startup
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		-- signs = not vt,
	}
end, { desc = "LSP Toggle Riagnostic" })

vim.keymap.set("n", "<leader>dc" ,"<Cmd>DiagnosticToggle<CR>", { desc = "LSP Toggle Riagnostic" })
