local nvim_efm_setup = {}

local utils = require("nvim-efm-setup.utils")
local lspconfig = require("lspconfig")
local tools = require("nvim-efm-setup.configs")

local function get_root_patterns()
  return utils.get_unique(tools, "root_pattern")
end

local function get_filetypes()
  return utils.get_unique(tools, "filetypes")
end

local function get_languages()
  local languages = {}

  for _, tool in pairs(tools) do
    for _, ft in pairs(tool.filetypes) do
      if languages[ft] == nil then
        languages[ft] = {}
      end
      table.insert(languages[ft], tool.settings)
    end
  end

  return languages
end

local function get_root_dir()
  return function(fname)
    for _, tool in pairs(tools) do
      for _, ft in pairs(tool.filetypes) do
        if fname:match("." .. ft) then
          local root_patterns = vim.tbl_flatten(tool.root_pattern)
          return lspconfig.util.root_pattern(root_patterns)(fname)
        end
      end
    end
    return nil
  end
end

local function get_settings()
  return {
    rootMarkers = get_root_patterns(),
    languages = get_languages(),
  }
end

local function get_on_attach()
  return function(client)
    client.resolved_capabilities.rename = false
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.hover = false
    client.resolved_capabilities.goto_definition = false
    client.resolved_capabilities.completion = false
  end
end

function nvim_efm_setup.get_default_config(opts)
  return {
    filetypes = get_filetypes(),
    root_dir = get_root_dir(),
    settings = get_settings(),
    on_attach = get_on_attach(),
  }
end

return nvim_efm_setup
