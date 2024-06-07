return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    require("cmp").setup({
      experimental = {
        ghost_text = true,
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = "", },
        }),
      }
    })
  end,
}
