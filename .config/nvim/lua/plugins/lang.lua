return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
  	opts = {
      ensure_installed = {
      	"lua-language-server", "stylua",
      	"html-lsp", "css-lsp" , "prettier"
    	},
  	},
  },

  {
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
 	  opts = {
   		ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
  	},
  },
 }

