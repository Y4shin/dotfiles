local mymodule = {}

function mymodule.setup()
  local maybeRequire = require("lib.mod").maybeRequire
  local configs = require("globals").configs
  local packer_bootstrap = false;

  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float({border = "rounded"})
      end,
    },
  }

  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
  end

  local function plugins(use)
    for _, config_name in ipairs(configs) do
      local package = maybeRequire("config." .. config_name .. ".pack")
      if package.ok then
        for _, pkg in ipairs(package.package.packages) do
          use(pkg)
        end
      end
    end

    if packer_bootstrap then
      print("Restart Neovim to enable packer")
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)

  --require("packer").startup(function()

  --  for _, config_name in ipairs(configs) do
  --    local package_module = "config." .. config_name .. ".pack"
  --    if isModuleAvailable(package_module) then
  --      for _, package_config in ipairs(require(package_module).packages) do
  --        use(package_config)
  --      end
  --    end
  --  end

  --end)
end

return mymodule
