local mymodule = {}

function mymodule.setup()
    local Wrapper = require("consolation").Wrapper
    local term = require("Fterm.terminal")
    Runner = term:new()--:setup()
    FtermWrapper = Wrapper:new()
    FtermWrapper:setup {
        create = function() Runner:open() end,
        open = function(_) Runner:open() end,
        close = function(_) Runner:close() end,
        kill = function(_) Runner:close(true) end
    }
end

return mymodule
