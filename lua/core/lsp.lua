local lspconfig = require("lspconfig")

-- Setup LSP servers
lspconfig.pyright.setup({})
lspconfig.tsserver_plugins.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

-- Autoformat saat save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
