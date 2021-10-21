local M = {}

function M.get_opts()
  local config = require("efm_setup.configs")
  return require("efm_setup.efm_setup").get_language_server_options(config)
end

return M
