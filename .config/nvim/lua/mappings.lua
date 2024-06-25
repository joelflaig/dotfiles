-- mapping shortcuts
local map = vim.keymap.set
local unmap = vim.keymap.del

-- telescope
local telescope = require('telescope.builtin')

-- basic mappings
map("n", ";", ":", { desc = " CMD enter command mode" })
map("n", "<leader>dd", "<cmd> Dashboard <cr>", { desc = "󰕮 Display Dashboard" })
-- map("i", "jk", "<ESC>")
-- map("i", "<Enter>", "<CR>")
map("n", "<leader>q", "<cmd> qa <cr>", { desc = " Quit all open buffers"})
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
map('n', '<leader>tel', '<cmd> Telescope <cr>', {}, { desc = "Open telescope" })
map('n', '<leader>ff', telescope.find_files, {}, { desc = " Find files" })
map('n', '<leader>fg', telescope.live_grep, {}, { desc = " Find text" })
map('n', '<leader>fb', telescope.buffers, {}, { desc = " Find buffers" })
map('n', '<leader>fh', telescope.help_tags, {}, { desc = " Find help" })

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

