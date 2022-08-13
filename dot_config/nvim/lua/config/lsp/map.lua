local map = require("lib.map").map

map('n', '<leader>ad', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>aD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>ai', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>aw', ':lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<leader>aW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', '<leader>ar', ':lua vim.lsp.buf.references()<CR>')
map('n', '<leader>at', ':lua vim.lsp.buf.type_definition<CR>')
map('n', '<leader>ah', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>as', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>aa', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>aR', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>aF', ':lua vim.lsp.buf.formatting()<CR>')
