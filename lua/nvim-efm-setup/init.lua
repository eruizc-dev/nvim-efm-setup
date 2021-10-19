local nvim_efm_setup = {}

local lspconfig = require("lspconfig")
local configs = require("nvim-efm-setup.configs")


local function get_filetypes()
  local filetypes = { "lua" }
  return filetypes
end

local function get_root_dir()
  return function(fname)
    if fname:match(".lua") then
      return lspconfig.util.root_pattern(".stylua.toml")(fname)
    end
    return nil
  end
end

local function get_settings()
  local root_markers = { "checkstyle.xml", ".stylua.toml", ".git" }
  local languages = {
    lua = {
      configs.stylua.settings,
    },
  }

  return {
    rootMarkers = root_markers,
    languages = languages,
  }
end

function nvim_efm_setup.get_default_config(opts)
  return {
    filetypes = get_filetypes(),
    root_dir = get_root_dir(),
    settings = get_settings(),
    on_attach = function(client)
      client.resolved_capabilities.rename = false
      client.resolved_capabilities.document_formatting = true
      client.resolved_capabilities.hover = false
      client.resolved_capabilities.goto_definition = false
      client.resolved_capabilities.completion = false
    end
  }
end

return nvim_efm_setup
