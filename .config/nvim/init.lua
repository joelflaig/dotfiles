-- config
vim.g.mapleader = ' '
vim.g.localleader = ' '
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- background color

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

-- dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#5f5f5f" })

-- mappings
vim.schedule(function()
  require "mappings"
end)

