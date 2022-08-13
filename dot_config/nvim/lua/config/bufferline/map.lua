local map = require("lib.map").map


map("n", "<leader>bl", ":BufferLineCycleNext<CR>", {silent=true})
map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", {silent=true})
map("n", "<leader>bL", ":BufferLineMoveNext<CR>", {silent=true})
map("n", "<leader>bH", ":BufferLineMovePrev<CR>", {silent=true})
map("n", "<leader>be", ":BufferLineSortByExtension<CR>", {silent=true})
map("n", "<leader>bd", ":BufferLineSortByDirectory<CR>", {silent=true})
