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

function utils.tbl_sublist(list, start, elements)
  local result = {}
  for i = start or 1, elements or #list, 1 do
    result[i + 1 - start] = list[i]
  end
  return result
end

function utils.split_cmd(command)
  local cmd = command[1]
  local args = utils.tbl_sublist(command, 2)
  return cmd, args
end

return utils
