local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,

  -- xml
  b.formatting.xmlformat,

  b.formatting.google_java_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
