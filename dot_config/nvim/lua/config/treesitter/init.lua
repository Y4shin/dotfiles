local mymodule = {}

function mymodule.setup()
  local configs = require('nvim-treesitter.configs')
  configs.setup({
    ensure_installed = {"rust", "lua", "typescript", "html", "c", "cpp", "java", "javascript", "jsdoc", "json", "latex", "prisma", "python", "sql", "svelte", "yaml"},
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["<leader>caf"] = "@function.outer",
          ["<leader>cif"] = "@function.inner",
          ["<leader>cac"] = "@class.outer",
          ["<leader>cic"] = "@class.inner"
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["<leader>cnf"] = "@function.outer",
          ["<leader>cnc"] = "@class.outer",
        },
        goto_next_end = {
          ["<leader>cNf"] = "@function.outer",
          ["<leader>cNc"] = "@class.outer",
        },
        goto_previous_start = {
          ["<leader>cpf"] = "@function.outer",
          ["<leader>cpc"] = "@class.outer",
        },
        goto_previous_end = {
          ["<leader>cPf"] = "@function.outer",
          ["<leader>cPc"] = "@class.outer",
        },
      }
    }
  })

  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return mymodule

