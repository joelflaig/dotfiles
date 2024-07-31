-- Neovim config
-- leader
vim.g.mapleader = ' '
vim.g.localleader = ' '
-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
-- pairs
vim.cmd.set("mps+=<:>")
-- numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
-- splits
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- lualine always at bottom, no split
vim.cmd.set('ls=3')
-- fold
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
vim.o.foldcolumn = 'auto:9'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- nerd font
vim.g.have_nerd_font = true
-- termguicolors
vim.opt.termguicolors = true
-- Indent line highlight
vim.cmd.highlight('IndentLine guifg=#767676')
-- Current indent line highlight
vim.cmd.highlight('IndentLineCurrent guifg=#ffaf87')
-- cursorline
vim.o.cursorline = true
-- conceal
vim.wo.conceallevel = 2
-- readable line length (obsidian)
vim.cmd("hi ColorColumn guibg=#222335")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },{
  pattern = { "*.md" },
  callback = function (_)
    vim.o.cc = "65"
    vim.cmd("hi ColorColumn guibg=#222335")
  end
})

vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" },{
  pattern = { "*.md" },
  callback = function (_)
    vim.o.cc = ""
  end
})

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- lazy config
require("lazy").setup("plugins", lazy_config)

-- lspconfig load
require("configs.lspconf")

-- dapconfig load
require("configs.dapconf")

-- startup commands load
require("configs.startup")

-- indent config load
require("configs.indent")

-- colorscheme
vim.cmd "colorscheme catppuccin-mocha"

-- dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#5f5f5f" })
-- { fg = "#89b4fa" }

-- mappings
vim.schedule(function()
  require "mappings"
end)

