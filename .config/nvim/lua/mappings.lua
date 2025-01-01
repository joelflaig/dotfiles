-- mapping shortcuts
local map = vim.keymap.set
local unmap = vim.keymap.del

-- remap command mode enter
map({ "n", "v" }, ";", ":", { desc = " CMD enter command mode" })

-- dashboard -whyever
map("n", "<leader>dd", "<cmd> Dashboard <cr>", { desc = "󰕮 Display Dashboard" })
-- map("i", "jk", "<ESC>")
-- map("i", "<Enter>", "<CR>")

-- basic mappings
map("n", "<leader>w<cr>", "<cmd> wa <cr>", { desc = " Save" })
map("n", "<leader>wq", "<cmd> wqa <cr>", { desc = " Save and quit" })
map("n", "<leader>l", "<cmd> Lazy <cr>", { desc = "󰒲 Open Lazy" })
map("n", ")", "^", { desc = "Jump to first non-white" })

-- greatest remap ever - ThePrimeagen
map("n", "<leader>p", "\"_dP")

-- Notifications
map("n", "<leader>nd", "<cmd> Noice dismiss <cr>", { desc = "Dismiss Notifications" })

-- scroll
map({"n", "v"}, "<Down>", "jzz", { desc = "Scroll down" })
map({"n", "v"}, "<Up>", "kzz", { desc = "Scroll up" })

-- split
map("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>S", "<C-w>s", { desc = "Split horizontally" })

-- buffer nav
map('n', "<leader>w", "<C-w>")
-- map('n', "<C-h>", "<C-w>h")
-- map('n', "<C-j>", "<C-w>j")
-- map('n', "<C-k>", "<C-w>k")
-- map('n', "<C-l>", "<C-w>l")

-- buffer resize
map('n', "<M-h>", "<C-w><")
map('n', "<M-j>", "<C-w>+")
map('n', "<M-k>", "<C-w>-")
map('n', "<M-l>", "<C-w>>")

-- telescope mappings
map('n', '<leader>f<cr>', '<cmd> Telescope hidden=true no_ignore=true', { desc = " Open telescope" })
map('n', '<leader>ff', '<cmd> Telescope find_files hidden=true no_ignore=true <cr>', { desc = " Find files" })
map('n', '<leader>fg', '<cmd> Telescope live_grep hidden=true no_ignore=true <cr>', { desc = " Find text" })
map('n', '<leader>fb', '<cmd> Telescope buffers hidden=true no_ignore=true <cr>', { desc = " Find buffers" })
map('n', '<leader>fh', '<cmd> Telescope help_tags hidden=true no_ignore=true <cr>', { desc = " Find help" })
map('n', '<leader>fr', '<cmd> Telescope oldfiles hidden=true no_ignore=true <cr>', { desc = "󰑐 Find old files"})
map('n', '<leader>fc', '<cmd> Telescope current_buffer_fuzzy_find <cr>', { desc = " Find in current buffer" })

-- gitsigns
map('n', '<leader>tlb', '<cmd> Gitsigns toggle_current_line_blame <cr>', { desc = "Toggle git blame" })

-- fold
map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)

-- debug
map('n', '<leader>db', require "dapui".toggle, { desc = " Toggle debugger" })
map('n', '<leader>b<space>', require 'dap'.continue, { desc = " Continue" })
map('n', '<leader>bl', require 'dap'.step_over, { desc = " Step over" })
map('n', '<leader>bj', require 'dap'.step_into, { desc = " Step into" })
map('n', '<leader>bk', require 'dap'.step_out, { desc = " Step out" })
map('n', '<leader>bp', require 'dap'.toggle_breakpoint, { desc = " Toggle breakpoint" })
map('n', '<leader>be', require("dapui").eval, { desc = " Evaluate expression" })
map('n', '<leader>bf', require("dapui").float_element, { desc = " Open in float" })

-- neotree
-- map('n', '<leader>ft', '<cmd> Neotree toggle <cr>', { desc = " Toggle filetree"})
map('n', '<leader>tc', '<cmd> Neotree current <cr>', { desc = " Toggle filetree fullscreen"})
map("n", "<leader>tf", "<cmd> Neotree filesystem <cr>", { desc = " Filesystem" })
map("n", "<leader>tg", "<cmd> Neotree git_status <cr>", { desc = "󰊢 Git status" })
map("n", "<leader>tb", "<cmd> Neotree buffers <cr>", { desc = "󰈚 Buffers" })

-- buffers
map("n", "<leader>q", "<cmd> bdelete <cr>", { desc = " Close current buffer" })
map("n", "<leader>H", "<cmd> BufferPrevious <cr>", { desc = " Goto previous buffer" })
map("n", "<leader>L", "<cmd> BufferNext <cr>", { desc = " Goto previous buffer" })
map("n", "<leader>J", "<cmd> BufferFirst <cr>", { desc = " Goto first buffer" })
map("n", "<leader>K", "<cmd> BufferLast <cr>", { desc = " Goto last buffer" })
map("n", "<leader>e", "<cmd> e no name <cr>", { desc = " Create new buffer" })

-- outline
map("n", "<leader>so", "<cmd> SymbolsOutline <cr>", { desc = "Toggle Outline" })

-- sidebar
map("n", "<leader>sb", "<cmd> SidebarNvimToggle <cr>", { desc = "Toggle sidebar" })

-- dropbar
map("n", "<leader>dp", function() require('dropbar.api').pick() end, { desc = " Pick dropbar" })
map("n", "<leader>df", function() require("dropbar.menu").dropbar_menu_t:fuzzy_find_open() end,{ desc = " Fuzzy pick dropbar" })

-- luasnip
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if vim.snippet.active({ direction = 1 }) then
    return '<cmd>lua vim.snippet.jump(1)<cr>'
  else
    return '<Tab>'
  end
end, { desc = "Jump to next snippet placeholder", expr = true })

map("i", "<C-s>", function ()
  require("luasnip.extras.select_choice")()
end)

map("v", "<C-b>", function ()
  vim.cmd('normal "ac')
  require("luasnip.extras.otf").on_the_fly()
end, { desc = "Expand otf snippet in register a" })

map("i", "<C-b>", function ()
  require("luasnip.extras.otf").on_the_fly("a")
end, { desc = "Expand otf snippet in register a" })

-- color picker
map("n", "<leader>cph", function ()
  require("minty.huefy").toggle()
end)

map("n", "<leader>cps", function ()
  require("minty.shades").toggle()
end)

-- For border or without border
-- require("minty.huefy").toggle( { border = true } )
-- add border=false for flat look on shades window

