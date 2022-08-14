local mymodule = {}

function mymodule.packsetup()
  local maybeRequire = require("lib.mod").maybeRequire
  local alphaMod = maybeRequire("alpha")
  if not alphaMod.ok then
    return
  end
  local alpha = alphaMod.package
  local dashboard = require("alpha.themes.dashboard")
  local function header()
    return {
      [[ ________   _______   ________  ___      ___ ___  _____ ______      ]],
      [[|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ]],
      [[\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
      [[ \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
      [[  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ ]],
      [[   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
      [[    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|]],
      [[                                                                    ]],
    }
  end

  dashboard.section.header.val = header()

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", "  Configuration", ":e $HOME/.local/share/chezmoi/dot_config/nvim <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "%d-%m-%Y  %H:%M:%S"
    local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

function mymodule.setup()
end

return mymodule
