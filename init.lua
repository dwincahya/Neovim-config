require("core.options")
require("core.mappings")
require("core.plugins")
require("core.lsp")
require("project_nvim").setup({
    detection_methods = { "pattern" },
    patterns = { ".git", "package.json", "pyproject.toml", "init.lua", "Makefile" },
  })
  
  require("telescope").load_extension("projects")
  
vim.cmd.colorscheme("tokyonight")
