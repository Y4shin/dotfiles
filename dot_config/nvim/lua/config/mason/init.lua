local mymodule = {}

function mymodule.setup()
  local oa = function(_, bufnr)
    local map = require("lib.map").map
    local bufopts = {noremap = true, silent=true, buffer=bufnr}
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    map("n", "<leader>ad", ":lua vim.lsp.buf.definition()<CR>", bufopts)
    map("n", "<leader>aD", ":lua vim.lsp.buf.declaration()<CR>", bufopts)
    map("n", "<leader>ai", ":lua vim.lsp.buf.implementation()<CR>", bufopts)
    map("n", "<leader>aw", ":lua vim.lsp.buf.document_symbol()<CR>", bufopts)
    map("n", "<leader>aW", ":lua vim.lsp.buf.workspace_symbol()<CR>", bufopts)
    map("n", "<leader>ar", ":lua vim.lsp.buf.references()<CR>", bufopts)
    map("n", "<leader>at", ":lua vim.lsp.buf.type_definition<CR>", bufopts)
    map("n", "<leader>ah", ":lua vim.lsp.buf.hover()<CR>", bufopts)
    map("n", "<leader>as", ":lua vim.lsp.buf.signature_help()<CR>", bufopts)
    map("n", "<leader>aa", ":lua vim.lsp.buf.code_action()<CR>", bufopts)
    map("n", "<leader>aR", ":lua vim.lsp.buf.rename()<CR>", bufopts)
    map("n", "<leader>aF", ":lua vim.lsp.buf.formatting()<CR>", bufopts)
  end

  require("mason").setup({})
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer"},
  })

  local cap = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  mason_lspconfig.setup_handlers({
    function (server_name)
      if server_name == "sumneko_lua" then
        require("lspconfig")[server_name].setup({
          on_attach = oa,
          capabilities = cap,
          settings = {
            Lua = {
              diagnostics = {
                globals = {"vim", "use"}
              }
            }
          }
        })
      else
        require("lspconfig")[server_name].setup({
          on_attach = oa,
          capabilities = cap,
        })
      end
    end
  })
 -- require('lspconfig')["sumneko_lua"].setup {
 --   on_attach = oa,
 --   settings = {
 --     Lua = {
 --       runtime = {
 --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
 --         version = 'LuaJIT',
 --       },
 --       diagnostics = {
 --         -- Get the language server to recognize the `vim` global
 --         globals = {'vim'},
 --       },
 --       workspace = {
 --         -- Make the server aware of Neovim runtime files
 --         library = vim.api.nvim_get_runtime_file("", true),
 --       },
 --       -- Do not send telemetry data containing a randomized but unique identifier
 --       telemetry = {
 --         enable = false,
 --       },
 --     },
 --   },
 -- }
end

return mymodule
