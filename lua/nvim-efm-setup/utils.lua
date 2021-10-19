local utils = {}

function utils.get_unique(list, key)
  local map = {}

  for _, element in pairs(list) do
    for _, value in pairs(element[key]) do
      map[value] = true
    end
  end

  local arr = {}
  for ft, _ in pairs(map) do
    table.insert(arr, ft)
  end

  return arr
end

return utils
