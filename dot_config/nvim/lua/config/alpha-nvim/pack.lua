local mymodule = {}

mymodule.packages = {{
  "goolord/alpha-nvim",
  config = function()
    require("config.alpha-nvim").packsetup()
  end,
}}

return mymodule
