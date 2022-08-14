local mymodule = {}

function mymodule.setup()
  local map = require("lib.map").map

  map('n', '<Leader>T', '<CMD>lua require("FTerm").toggle()<CR>', { silent = true })
  map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { silent = true })
end

return mymodule

