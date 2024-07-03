return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()

    local city =
"               .                   .     .              \n"..
"   +                    │      ;                 +      \n"..
"                .      ╭╯╮   --+- -                     \n"..
"        .            . │ │     !   .   ╭─────╮     ╭╮   \n"..
"                ╭──╮  ╭╯'│  +    ╭─╮   │.   ╭╯ ╭───╯│   \n"..
"     ╭─╮    ╭───╯  ╰╮ │  ╰╮   ╭──╯'│ . ││   │╭─╯   .│   \n"..
".  ╭─╯ │ ╭──╯    │  │╭╯   ╰─╮ │    │   │    ││     ││   \n"..
"   │'  │ │ │.    │  ││    │ │ │    │ ╭─╯    ││     ││   \n"..
"───╯   ╰─╯       '  ╰╯    ' ╰─╯    ╰─╯'     ╰╯      ╰───\n"

    local monster =
"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆        \n"..
"   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      \n"..
"         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷     ⠻⠿⢿⣿⣧⣄   \n"..
"          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄ ⣀⠄⠢⣀⡀⠈⠙⠿⠄  \n"..
"         ⢠⣿⣿⣿⠈   ⣻⣿⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  \n"..
"  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ \n"..
" ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  \n"..
"⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ \n"..
"⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄\n"..
"     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    \n"..
"      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣤⣾⡿⠃    \n"

    local logo = city

    logo = string.rep("\n", 6) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "ene | startinsert", desc = " new file", icon = " ", key = "e" },
          { action = "Telescope find_files hidden=true no_ignore=true", desc = " find file", icon = "󰱼 ", key = "f" },
          { action = "Telescope oldfiles hidden=true no_ignore=true", desc = " recent files", icon = "󰑐 ", key = "r" },
          { action = "Telescope live_grep hidden=true no_ignore=true", desc = " find text", icon = "󰺮 ", key = "g" },
          { action = "Neotree", desc = " open filetree", icon = " ", key = "t" },
          { action = 'lua require("persistence").load({ last = true })', desc = " last session", icon = " ", key = "s" },
          { action = 'lua require("persistence").load()', desc = " cwd session", icon = " ", key = "c" },
          { action = "Lazy", desc = " lazy", icon = "󰒲 ", key = "l" },
          { action = "qa", desc = " quit", icon = " ", key = "q" },
        },

        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
      button.key_format = string.gsub(button.key, "<space>", "   SPC ")
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
