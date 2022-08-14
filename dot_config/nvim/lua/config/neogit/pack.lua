local mymodule = {}

mymodule.packages = {{
  "TimUntersberger/neogit",
  config = function()
    require("config.neogit").packsetup()
  end,
  requires = {"nvim-lua/plenary.nvim"}
}}

return mymodule
