return {
  "mistricky/codesnap.nvim",
  lazy = false,
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "v", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "v", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "default",
    watermark = "Joel Flaig",
    mac_window_bar = true,
  },
}
