-- mapping shortcuts
local map = vim.keymap.set
local unmap = vim.keymap.del

-- telescope
local telescope = require('telescope.builtin')

-- basic mappings
map("n", ";", ":", { desc = " CMD enter command mode" })
map("n", " d", "<cmd> Dashboard <cr>", { desc = "󰕮 Display Dashboard" })
-- map("i", "jk", "<ESC>")
-- map("i", "<Enter>", "<CR>")
map("n", " q", "<cmd> qa <cr>", { desc = " Quit all open buffers"})
map("n", " w", "<cmd> wa <cr>", { desc = " Save"})
map("n", " wq", "<cmd> wqa <cr>", { desc = " Save"})
map("n", " l", "<cmd> Lazy <cr>", { desc = "󰒲 Open Lazy" })

-- telescope mappings
map('n', '<leader>ff', telescope.find_files, {}, { desc = " Find files" })
map('n', '<leader>fg', telescope.live_grep, {}, { desc = " Find text" })
map('n', '<leader>fb', telescope.buffers, {}, { desc = " Find buffers" })
map('n', '<leader>fh', telescope.help_tags, {}, { desc = " Find help" })

