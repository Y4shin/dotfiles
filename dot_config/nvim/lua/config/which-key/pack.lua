local mymodule = {}

mymodule.packages = {{
  "folke/which-key.nvim",
  config = function()
    require("config/which-key").packsetup()
  end
}}

return mymodule
