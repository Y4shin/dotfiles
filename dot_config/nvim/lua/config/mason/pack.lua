local mymodule = {}

mymodule.packages = {{
  "williamboman/mason.nvim",
  requires = {
    "neovim/nvim-lsp",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
  },
}}

return mymodule
