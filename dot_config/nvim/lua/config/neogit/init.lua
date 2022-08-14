local mymodule = {}

function mymodule.packsetup()
  local maybeRequire = require("lib.mod").maybeRequire
  local neogitModule = maybeRequire("neogit")
  if (neogitModule.ok) then
    neogitModule.package.setup({})
  end
end

function mymodule.setup()
end

return mymodule
