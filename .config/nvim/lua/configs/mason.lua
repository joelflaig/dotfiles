local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
  },
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  ensure_installed = {
    "lua_language_server",
    "rust_analyzer",
  }
})

