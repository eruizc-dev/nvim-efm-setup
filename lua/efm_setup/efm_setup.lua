local M = {}

local utils = require("efm_setup.utils")

local function get_root_patterns(config)
  return utils.get_unique(config, "root_patterns")
end

local function get_filetypes(config)
  return utils.get_unique(config, "filetypes")
end

local function get_language_settings(config)
  local languages = {}

  for _, tool in pairs(config) do
    for _, ft in pairs(tool.filetypes) do
      if languages[ft] == nil then
        languages[ft] = {}
      end
      table.insert(languages[ft], tool.settings)
    end
  end

  return languages
end

local function get_root_dir(config)
  return function(fname)
    local lspconfig = require("lspconfig")
    for _, tool in pairs(config) do
      for _, extension in pairs(tool.file_extensions) do
        if fname:match("." .. extension) then
          local root_patterns = vim.tbl_flatten(tool.root_patterns)
          return lspconfig.util.root_pattern(root_patterns)(fname)
        end
      end
    end
    return nil
  end
end

local function get_on_attach()
  return function(client)
    client.resolved_capabilities.document_formatting = true

    client.resolved_capabilities.rename = false
    client.resolved_capabilities.hover = false
    client.resolved_capabilities.goto_definition = false
    client.resolved_capabilities.completion = false
  end
end

local function filter_installed(declared_linters)
  local installed_linters = {};
  local tasks = {}

  for name, settings in pairs(declared_linters) do
    tasks[name] = true
    local cmd, args = utils.split_cmd(settings.healthCheck)
    local handle = vim.loop.spawn(cmd, { args = args }, function(code)
      if code == 0 then
        table.insert(installed_linters, settings)
      end
      tasks[name] = false
    end)
  end

  vim.wait(1000, function()
    for _, executing in pairs(tasks) do
      if executing == true then
        return false
      end
    end
    return true
  end)

  return installed_linters
end

function M.get_language_server_options(linters)
  local installed_linters = filter_installed(linters)
  return {
    filetypes = get_filetypes(installed_linters),
    root_dir = get_root_dir(installed_linters),
    settings = {
      rootMarkers = get_root_patterns(installed_linters),
      languages = get_language_settings(installed_linters),
    },
    on_attach = get_on_attach(),
  }
end

return M
