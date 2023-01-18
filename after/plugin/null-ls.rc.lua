local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

	-- cpp
	b.formatting.clang_format,

	b.formatting.codespell,
	b.formatting.dart_format,

	-- Use Deno to format TypeScript, JavaScript/JSON and markdown.
	b.formatting.deno_fmt,
	b.formatting.deno_fmt.with { filetypes = { "markdown" } }, -- only runs `deno fmt` for markdown

	b.formatting.eslint,
	b.formatting.fixjson,
	b.formatting.gofmt,
	b.formatting.google_java_format,
	b.formatting.jq,
	b.formatting.tidy,
	b.formatting.prettier,
}

null_ls.setup {
	debug = true,
	sources = sources,
}
