return {
  "MeanderingProgrammer/markdown.nvim",
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  config = function()
    require('render-markdown').setup({})
  end,
}

