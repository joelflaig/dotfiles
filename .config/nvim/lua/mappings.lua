-- mapping shortcuts
local map = vim.keymap.set
local unmap = vim.keymap.del

-- basic mappings
map({ "n", "v" }, ";", ":", { desc = " CMD enter command mode" })
map("n", "<leader>dd", "<cmd> Dashboard <cr>", { desc = "󰕮 Display Dashboard" })
map({"n", "v"}, "J", "jzz")
map({"n", "v"}, "K", "kzz")
-- map("i", "jk", "<ESC>")
-- map("i", "<Enter>", "<CR>")
map("n", "<leader>w", "<cmd> wa <cr>", { desc = " Save"})
map("n", "<leader>wq", "<cmd> wqa <cr>", { desc = " Save"})
map("n", "<leader>l", "<cmd> Lazy <cr>", { desc = "󰒲 Open Lazy" })
map("n", "9", "^", { desc = "Jump to first non-white" })

-- buffer nav
map('n', "<leader>w", "<C-w>")
map('n', "<C-h>", "<C-w>h")
map('n', "<C-j>", "<C-w>j")
map('n', "<C-k>", "<C-w>k")
map('n', "<C-l>", "<C-w>l")

-- buffer resize
map('n', "<M-h>", "<C-w><")
map('n', "<M-j>", "<C-w>+")
map('n', "<M-k>", "<C-w>-")
map('n', "<M-l>", "<C-w>>")

-- telescope mappings
map('n', '<leader>tel', '<cmd> Telescope hidden=true no_ignore=true <cr>', { desc = " Open telescope" })
map('n', '<leader>ff', '<cmd> Telescope find_files hidden=true no_ignore=true <cr>', { desc = " Find files" })
map('n', '<leader>fg', '<cmd> Telescope live_grep hidden=true no_ignore=true <cr>', { desc = " Find text" })
map('n', '<leader>fb', '<cmd> Telescope buffers hidden=true no_ignore=true <cr>', { desc = " Find buffers" })
map('n', '<leader>fh', '<cmd> Telescope help_tags hidden=true no_ignore=true <cr>', { desc = " Find help" })
map('n', '<leader>fr', '<cmd> Telescope oldfiles hidden=true no_ignore=true <cr>', { desc = "󰑐 Find old files"})

-- gitsigns
map('n', '<leader>tlb', '<cmd> Gitsigns toggle_current_line_blame <cr>', { desc = "Toggle git blame" })

-- fold
map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)

-- debug
map('n', '<leader>db', require "dapui".toggle, { desc = " Toggle debugger" })
map('n', '<leader>b<space>', require 'dap'.continue)
map('n', '<leader>bl', require 'dap'.step_over)
map('n', '<leader>bj', require 'dap'.step_into)
map('n', '<leader>bk', require 'dap'.step_out)
map('n', '<leader>b', require 'dap'.toggle_breakpoint)
map('n', '<leader>be', require("dapui").eval)
map('n', '<leader>bf', require("dapui").float_element)

-- filetree
map('n', '<leader>ft', '<cmd> Neotree toggle <cr>', { desc = " Toggle filetree"})
map('n', '<leader>fc', '<cmd> Neotree current <cr>', { desc = " Toggle filetree fullscreen"})

-- buffers
map("n", "<leader>q", "<cmd> BufferClose <cr>", { desc = " Close current buffer" })
map("n", "<leader>J", "<cmd> BufferPrevious <cr>", { desc = " Goto previous buffer" })
map("n", "<leader>K", "<cmd> BufferNext <cr>", { desc = " Goto previous buffer" })
map("n", "<leader>e", "<cmd> e no name <cr>", { desc = " Create new buffer" })
map("n", "<leader>p", "<cmd> BufferPin<cr>", { desc = " Pin current buffer" })

