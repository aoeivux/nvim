local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
   callback = function()
      if vim.api.nvim_buf_get_option(0, "buftype") ~= "terminal" then
         vim.cmd "lcd %:p:h"
      end
   end,
})


-- 打开时自动定位到上次关闭位置
autocmd(
  { "BufReadPost" },
  {pattern = "*", command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)




