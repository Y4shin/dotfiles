local util = require("formatter.util")

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
  }
})
