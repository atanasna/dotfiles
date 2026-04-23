-- Fix for tmux extended-keys encoding newlines as CSI u escape sequences during paste
vim.paste = (function(original)
  return function(lines, phase)
    local fixed = {}
    for _, line in ipairs(lines) do
      -- Replace CSI u encoded newline (Ctrl+J = \x1b[27;5;106~) with actual newline, then split
      local parts = vim.split(line:gsub('\027%[27;5;106~', '\n'), '\n', { plain = true })
      vim.list_extend(fixed, parts)
    end
    return original(fixed, phase)
  end
end)(vim.paste)
