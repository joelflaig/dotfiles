return {
  "joelflaig/harpoon",
  branch = "main",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,

  config = function ()
    local harpoon = require('harpoon')
    local extensions = require("harpoon.extensions")

    harpoon:setup({})

    harpoon:extend(extensions.builtins.navigate_with_number())

    vim.api.nvim_create_user_command("HarpoonRemove", function()
      harpoon:list():remove()
    end, { desc = "Remove last item of harpoon list" })


    vim.api.nvim_create_user_command("HarpoonClear", function()
      harpoon:list():clear()
    end, { desc = "Clear harpoon list" })

    -- add buffer to list
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "⇁ Add current buffer to harpoon list" })
    vim.keymap.set("n", "<leader>hw", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "⇁ Open harpoon window" })

    -- select buffers
    vim.keymap.set("n",  "<leader>h1", function() harpoon:list():select(1) end, { desc = "⇁ Open 1. buffer in harpoon list" })
    vim.keymap.set("n",  "<leader>h2", function() harpoon:list():select(2) end, { desc = "⇁ Open 2. buffer in harpoon list" })
    vim.keymap.set("n",  "<leader>h3", function() harpoon:list():select(3) end, { desc = "⇁ Open 3. buffer in harpoon list" })
    vim.keymap.set("n",  "<leader>h4", function() harpoon:list():select(4) end, { desc = "⇁ Open 4. buffer in harpoon list" })


    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>P", function() harpoon:list():prev() end, { desc = "⇁ Goto prev harpoon list buffer" })
    vim.keymap.set("n", "<leader>N", function() harpoon:list():next() end, { desc = "⇁ Goto next harpoon list buffer" })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end, { desc = "⇁ Open harpoon telescope" })
  end,
}


