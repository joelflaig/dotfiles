return {
	"nvim-treesitter/nvim-treesitter",
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "cpp", "lua", "python", "bash", "json", "yaml", "toml", "html", "markdown", "markdown_inline" },
      matchup = {
        enable = true,
      },
      highlight = {
        -- disable = { "help", "man" }, -- list of language that will be disabled
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
          "#f38ba8",
          "#fab387",
          "#f9e2af",
          "#a6e3a1",
          "#74c7ec",
          "#89b4fa",
          "#cba6f7",
        }, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      }
    }
  end
}
