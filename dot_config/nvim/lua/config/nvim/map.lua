require('lib.map')

-- Nvim Tree

map("n", "<Leader>t", ":NvimTreeToggle<CR>", { silent = true })


-- Pane Controls

map("n", "<Leader>wh", ":wincmd h<CR>", { silent = true })
map("n", "<Leader>wj", ":wincmd j<CR>", { silent = true })
map("n", "<Leader>wk", ":wincmd k<CR>", { silent = true })
map("n", "<Leader>wl", ":wincmd l<CR>", { silent = true })
map("n", "<Leader>ws", ":split<CR>", { silent = true })
map("n", "<Leader>w<S-s>", ":vsplit<CR>", { silent = true })
map("n", "<Leader>wq", ":q<CR>", { silent = true })

-- Fold Controls

map("n", "<Leader>fo", ":foldopen!<CR>", { silent = true })
map("n", "<Leader>fc", ":foldclose!<CR>", { silent = true })
map("n", "<Leader>ft", ":foldtoggle!<CR>", { silent = true })

