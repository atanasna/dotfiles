vim.filetype.add({
  pattern = {
    [".*%.json%.tpl"] = "json",
    [".*%.yaml%.tpl"] = "yaml"
  },
})
