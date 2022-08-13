local map = require("lib.map").map

-- Nvim Tree

map("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })


-- Pane Controls

map("n", "<leader>wh", ":wincmd h<CR>", { silent = true })
map("n", "<leader>wj", ":wincmd j<CR>", { silent = true })
map("n", "<leader>wk", ":wincmd k<CR>", { silent = true })
map("n", "<leader>wl", ":wincmd l<CR>", { silent = true })
map("n", "<leader>ws", ":split<CR>", { silent = true })
map("n", "<leader>w<S-s>", ":vsplit<CR>", { silent = true })
map("n", "<leader>wq", ":q<CR>", { silent = true })

-- Fold Controls

map("n", "<leader>fo", ":foldopen!<CR>", { silent = true })
map("n", "<leader>fc", ":foldclose!<CR>", { silent = true })
map("n", "<leader>ft", ":foldtoggle!<CR>", { silent = true })

-- Buffer Controls

map("n", "<leader>bj", ":bp|bd #<CR>", {})
