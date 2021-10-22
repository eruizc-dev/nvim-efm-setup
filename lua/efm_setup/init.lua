local M = {}

function M.get_opts(config)
  config = config  or {}
  local default_config = require("efm_setup.configs")
  local final_config = vim.tbl_extend("force", default_config, config)
  return require("efm_setup.efm_setup").get_language_server_options(final_config)
end

return M
