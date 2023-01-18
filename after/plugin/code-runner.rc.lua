local status_ok, runner = pcall(require, "code_runner")
if not status_ok then return end

runner.setup({
	-- choose default mode (valid term, tab, float, toggle, buf)
	mode = 'term',
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = true,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	term = {
		--  Position to open the terminal, this option is ignored if mode is tab
		position = "bot",
		-- window size, this option is ignored if tab is true
		size = 8,
	},
	float = {
		-- Key that close the code_runner floating window
		close_key = '<ESC>',
		-- Window border (see ':h nvim_open_win')
		border = "none",

		-- Num from `0 - 1` for measurements
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = "FloatBorder",
		float_hl = "Normal",

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	-- put here the commands by filetype
	filetype = {
		lua = "lua",
		go = "go run",
		groovy = "groovy",
		bat = "cmd /c",
		scala = "scala",
		swift = "swift",
		julia = "julia",
		r = "Rscript",
		dart = "dart",
		csharp = "scriptcs",
		shellscript = "bash",
		python = "python3 -u",
		typescript = "deno run";
		vbscript = "cscript //Nologo",
		powershell = "powershell -ExecutionPolicy ByPass -File",
		less = "cd $dir && lessc $fileName $fileNameWithoutExt.css",
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		cpp = "cd $dir && clang++ -std=c++11 $fileName -o $fileNameWithoutExt && /$dir/$fileNameWithoutExt",
		c = "cd $dir && clang -std=c11 $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
	},

	-- filetype_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/code_runner.json",
	-- project_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/code_runner.nvim/lua/code_runner/project_manager.json",
	-- project = {},

})

vim.keymap.set('n', '<leader>rc', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
