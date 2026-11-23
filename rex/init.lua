rex.bind("cmd+l", "pane.split", { direction = "right" })
rex.bind("cmd+h", "pane.split", { direction = "left" })
rex.bind("cmd+j", "pane.split", { direction = "down" })
rex.bind("cmd+k", "pane.split", { direction = "up" })
rex.bind("cmd+f", "pane.zoom")
rex.bind("cmd+s", "session.new")
rex.bind("cmd+shift+s", "session.switch")
rex.bind("cmd+shift+t", "client.sidebar.filter.focus")

for key, direction in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("ctrl+" .. key, function(ctx)
    local process = rex.block.call("com.superlogical.terminal", "process", { block_id = ctx.block_id })
    local foreground = process and process.foreground
    if foreground then
      for _, name in ipairs({ foreground.name or "", (foreground.argv0 or ""):match("[^/]*$") }) do
        if name:match("^n?vim") then return false end
      end
    end
    rex.session.focus_direction({ direction = direction })
    return true
  end)
end
