local mymodule = {}

function mymodule.setup()
  local null_ls = require("null-ls")
  local prettier = require("prettier")
  local map = require("lib.map").map

  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.resolved_capabilities.document_formatting then
        map("n", "<Leader>f", ":lua vim.lsp.buf.formatting()<CR>", { silent = true })
        --vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
        -- format on save
        --vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      end

      if client.resolved_capabilities.document_range_formatting then
        --vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
      end
    end,
  })

  prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },

    -- prettier format options (you can use config files too. ex: `.prettierrc`)
    arrow_parens = "always",
    bracket_spacing = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 120,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
  })
end

return mymodule
