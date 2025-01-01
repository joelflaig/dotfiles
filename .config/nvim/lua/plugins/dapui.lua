return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup()
    vim.cmd.highlight("BP guifg=#fab387")
    vim.cmd.highlight("BPS guifg=#f38ba8")
    vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='BP', linehl ='', numhl ='BP'})
    vim.fn.sign_define('DapStopped',{ text ='', texthl ='BPS', linehl ='', numhl ='BPS'})
  end,
}

