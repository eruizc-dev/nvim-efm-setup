local nvim_efm_setup = {}

local lspconfig = require("lspconfig")
local tools = require("nvim-efm-setup.configs")

local function get_root_patterns()
  local root_map = {}

  for _, tool in pairs(tools) do
    for _, root in pairs(tool.root_pattern) do
      root_map[root] = true
    end
  end

  local root_arr = {}
  for ft, _ in pairs(root_map) do
    table.insert(root_arr, ft)
  end

  return root_arr
end

local function get_filetypes()
  local ft_map = {}

  for _, tool in pairs(tools) do
    for _, ft in pairs(tool.filetypes) do
      ft_map[ft] = true
    end
  end

  local ft_arr = {}
  for ft, _ in pairs(ft_map) do
    table.insert(ft_arr, ft)
  end

  return ft_arr
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
  local root_markers = get_root_patterns()
  local languages = {
    lua = {
      tools.stylua.settings,
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
    end,
  }
end

return nvim_efm_setup
