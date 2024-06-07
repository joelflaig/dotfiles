return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup()
    vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='', linehl ='', numhl =''})
    vim.fn.sign_define('DapStopped',{ text ='', texthl ='', linehl ='', numhl =''})
  end,
}
