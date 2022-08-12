-- init.lua

-- All actual configs live in their own subdirectories. These are organized by
-- the package name (nvim for vanilla nvim configs).
-- These can contain one of two files:
-- - init.lua:  This contains actual configurations.
-- - map.lua:   This contains key mappings.
-- - after.lua: This contains configurations that are meant to be ran at the
--              end.
--
-- Either files are optional, non existent files in the folders will not be
-- loaded.
--
-- Only the packer config is not in those folders.
--
-- The folder structure is as follows:
-- - nvim
--  - init.lua               (this file)
--  - lua
--   - package.lua
--   - config
--    - some_package_name
--     - init.lua            (optional)
--     - map.lua             (optional)
--     - after.lua           (optional)
--
--
-- For a config folder to be loaded it needs to be in the configs array.


-- List of configs to load
local configs = {"nvim", "nvim-tree", "treesitter", "lsp", "nvim-cmp", "luasnip", "formatter", "color"}

-- Load packer (package manager)
require("plugins")

-- Defining a function to check if a module exists
function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

-- Loop over specified config folders
for _, config_name in ipairs(configs) do
  -- Create path and module string
  local config_package = "config." .. config_name

  -- Check if init config exists and load it if it does.
  local init_package = config_package
  if isModuleAvailable(init_package) then
    require(init_package)
  end

  -- Check if map config exists and load it if it does.
  local map_package = config_package .. ".map"
  if isModuleAvailable(map_package) then
    require(map_package)
  end

  -- Check if after config exists and load it if it does.
  local after_package = config_package .. ".after"
  if isModuleAvailable(after_package) then
    require(after_package)
  end
end
