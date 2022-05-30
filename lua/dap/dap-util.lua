local M = {}
local dap =  require'dap'

function M.reload_continue()
  package.loaded['dap.dap-config'] = nil
  require('dap.dap-config').setup()
  dap.continue()
end

return M
