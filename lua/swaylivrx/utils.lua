local fn = vim.fn
local M = {}

M.plugins_path = fn.stdpath("data") .. "/site/pack/packer"
M.os = vim.loop.os_uname().sysname


-- Check for instalation status of plugin.
function M.is_plugin_installed(plugins_name)
	if fn.empty(fn.glob(M.plugins_path .. "/start/" .. plugins_name)) > 0
		and fn.empty(fn.glob(M.plugins_path .. "/opt/" .. plugins_name)) > 0
	then
		return false
	else
		return true
	end
end

return M
