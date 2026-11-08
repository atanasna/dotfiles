vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
  pattern = {
    [".*%.json$"] = "json",
    [".*%.json%.tpl$"] = "json",
    [".*%.json%.tftpl$"] = "json",
    [".*%.yaml$"] = "yaml",
    [".*%.yaml%.tpl$"] = "yaml",
    [".*%.yaml%.tftpl$"] = "yaml",
    [".*%.tfvars$"] = "terraform",
  },
})
