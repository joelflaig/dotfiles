local dap = require("dap")

dap.configurations.python = {
  {
    type = "python",
    request = 'launch',
    name = "Launch python file",
    program = "${file}",
    pythonPath = function ()
      return '/usr/bin/python'
    end
  }
}

dap.configurations.cpp = {
  {
    type = "cpp",
    request = 'launch',
    name = "Launch c++ file",
    program = "${file}",
    cppPath = function ()
      return 'usr/bin/c++'
    end
  }
}

