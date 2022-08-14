local mymodule = {}

function mymodule.setup()
  local opt = vim.opt
  opt.path:remove("/usr/include")
  opt.path:append("**")
  opt.wildignorecase = true
  opt.wildignore:append("**/node_modules/*")
end

return mymodule
