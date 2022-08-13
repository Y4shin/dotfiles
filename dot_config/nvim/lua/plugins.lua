local tableConcat = require("lib.tab").tableConcat
local isModuleAvailable = require("lib.mod").isModuleAvailable
local configs = require("globals").configs

return require("packer").startup(function()

  for _, config_name in ipairs(configs) do
    local package_module = "config." .. config_name .. ".pack"
    if isModuleAvailable(package_module) then
      for _, package_config in ipairs(require(package_module).packages) do
        use(package_config)
      end
    end
  end

--.  use("wbthomason/packer.nvim")
--.  use('shaunsingh/solarized.nvim')
--.  use('kyazdani42/nvim-web-devicons')
--.  use('kyazdani42/nvim-tree.lua')
--.  use('github/copilot.vim')
--.  use('nvim-treesitter/nvim-treesitter')
--.  use('neovim/nvim-lsp')
--.  use('williamboman/nvim-lsp-installer')
--.  use('hrsh7th/cmp-nvim-lsp')
--.  use('hrsh7th/cmp-buffer')
--.  use('hrsh7th/cmp-path')
--.  use('hrsh7th/cmp-cmdline')
--.  use('hrsh7th/nvim-cmp')
--.  use('L3MON4D3/LuaSnip')
--.  use('saadparwaiz1/cmp_luasnip')
--.  use('rafamadriz/friendly-snippets')
--.  use('mhartington/formatter.nvim')
--.  use({'akinsho/bufferline.nvim', tag = "v2.*",})
--.  use("tiagovla/scope.nvim")
--.  use("EdenEast/nightfox.nvim")
--.  use("numToStr/FTerm.nvim")
--.  use("pianocomposer321/consolation.nvim")
end)
