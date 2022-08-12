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
local configs = {"nvim", "nvim-tree", "treesitter", "lsp", "nvim-cmp", "luasnip"}

-- Load packer (package manager)
require("plugins")

-- Defining a function to check if a file can be read (i.e. for our purposes
-- whether it exists).
function file_exists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

-- Loop over specified config folders
for _, config_name in ipairs(configs) do
  -- Create path and module string
  local config_dir = "lua/config/" .. config_name
  local config_package = "config." .. config_name

  -- Check if init config exists and load it if it does.
  local init_file = config_dir .. "/init.lua"
  local init_package = config_package
  if (file_exists(init_file)) then
    require(init_package)
  end

  -- Check if map config exists and load it if it does.
  local map_file = config_dir .. "/map.lua"
  local map_package = config_package .. ".map"
  if (file_exists(map_file)) then
    require(map_package)
  end

  local after_file = config_dir .. "/after.lua"
  local after_package = config_package .. ".after"
  if (file_exists(after_file)) then
    require(after_package)
  end
end
