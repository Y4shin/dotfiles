local mymodule = {}

local command = [[
if exists("g:neovide")
  nmap <c-c> "+y
  vmap <c-c> "+y
  nmap <c-v> "+p
  inoremap <c-v> <c-r>+
  cnoremap <c-v> <c-r>+
  inoremap <c-r> <c-v>
  let g:neovide_input_use_logo=v:true
  let g:neovide_transparency=0.95
  set guifont=ComicCode\ Nerd\ Font
endif
]]

function mymodule.setup()
  vim.api.nvim_command(command)
end

return mymodule

