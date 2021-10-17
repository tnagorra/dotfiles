local utils = require 'utils'
local map = utils.map
local cmd = vim.cmd

map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>F', ':Rg ')

-- Override fzf command to pass different options
cmd [[
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.<q-args>, 1, fzf#vim#with_preview(), <bang>0)
]]
