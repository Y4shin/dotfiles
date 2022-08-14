local configs = require("globals").configs
local maybeRequire = require("lib.mod").maybeRequire

for _, config in ipairs(configs) do
  local afterconfig = maybeRequire("config." .. config .. ".after")
  if afterconfig.ok then
    afterconfig.package.setup()
  end
end
