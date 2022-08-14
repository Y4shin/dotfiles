local mymodule = {}

function mymodule.setup()
  vim.api.nvim_command("source vv.vim")
end

return mymodule

