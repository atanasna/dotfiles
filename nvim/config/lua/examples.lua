-- Print text as snacks notification
local function notify(msg)
  Snacks.notify(msg)
end

-- Print a table
local function print_table(table)
  print(vim.inspect(table))
end

-- Get unique entries in a list
local function get_unique(list)
    local seen = {}
    local result = {}
    
    for _, value in ipairs(list) do
        if not seen[value] then
            seen[value] = true
            table.insert(result, value)
        end
    end
    
    return result
end
