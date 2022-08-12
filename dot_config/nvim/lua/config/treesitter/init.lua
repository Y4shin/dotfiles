local configs = require('nvim-treesitter.configs')
configs.setup({
  ensure_installed = {"rust", "lua", "typescript", "html", "c", "cpp", "java", "javascript", "jsdoc", "json", "latex", "prisma", "python", "sql", "svelte", "yaml"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"