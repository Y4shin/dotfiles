local mymodule = {}

function mymodule.setup()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return mymodule

