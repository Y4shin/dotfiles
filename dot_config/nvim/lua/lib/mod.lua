local mymodule = {}

function mymodule.maybeRequire(name)
  local ok, result = pcall(require, name)
  return {
    ok = ok,
    package = result
  }
end

return mymodule;
