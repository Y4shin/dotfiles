require("lib.map")

map('n', '<Leader>T', '<CMD>lua require("FTerm").toggle()<CR>', { silent = true })
map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { silent = true })

