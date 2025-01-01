local use35 = true
vim.keymap.set('n', "<leader>g", function ()
  use35 = not use35
  if use35 then
    vim.notify("Using GPT model 3.5 turbo")
  else
    vim.notify("Using GPT model 4-1106 preview")
  end
end, { desc = "Switch gpt model"})

local home = vim.fn.expand("$HOME")

return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",

  config = function()
    vim.cmd([[sign define chatgpt_action_start_block text=╭ texthl=ErrorMsg linehl=BufferLineBackground]])
    vim.cmd([[sign define chatgpt_action_end_block text=╰ texthl=ErrorMsg linehl=BufferLineBackground]])

    vim.cmd([[sign define chatgpt_chat_start_block text=╭ texthl=Constant]])
    vim.cmd([[sign define chatgpt_chat_end_block text=╰ texthl=Constant]])

    local opts = {
      api_key_cmd = "gpg --decrypt " .. home .. "/secrets/openai.txt.gpg",
      chat = {
        welcome_message =
          "          The more you know, the more you hurt;         \n"..
          "      the more you understand, the more you suffer.     \n"..
          "                --- Ecclasiates 1, 18 ---               \n",
        loading_text = "Loading, please wait ...",
        question_sign = "", -- 🙂 
        answer_sign = "", -- 🤖 
        border_left_sign = "",
        border_right_sign = "",
        max_line_length = 120,
        sessions_window = {
          active_sign = " 󰛨 ",
          inactive_sign = " 󰛩 ",
          current_line_sign = "",
          border = {
            style = "rounded",
            text = {
              top = " Sessions ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
      },
      openai_params = {
        model = function ()
          if use35 then
            return "gpt-3.5-turbo"
          else
            return "gpt-4-1106-preview"
          end
        end,
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    }

  require("chatgpt").setup(opts)
  end,

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
