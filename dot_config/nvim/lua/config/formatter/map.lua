local mymodule = {}

function mymodule.setup()
  local map = require("lib.map").map
  
  map("n", "<leader>af", ":Format<CR>", {silent = true})
end

return mymodule
