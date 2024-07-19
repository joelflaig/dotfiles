return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-calc",
    "chrisgrieser/cmp-nerdfont",
  },
  config = function()
    require("cmp").setup({
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
