local utils = require 'utils'
local map = utils.map
local cmd = vim.cmd

map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>F', ':Rg ')

-- Using trim because there's a trailing whitespace
cmd[[
function GetRelativeWdProjectPath()
    let project_path = luaeval('require("wd-nvim").get_current_warp_name() or "."')
    let relative_project_path = system('realpath --relative-to="'.getcwd().'" "'.project_path.'"')
    return trim(relative_project_path)
endfunction

]]

-- Override fzf command to pass different options
cmd(([[
command! -bang -nargs=* Rg call fzf#vim#grep(
    'rg --column --line-number --no-heading --color=always --case-sensitive -- '.<q-args>.' "'.GetRelativeWdProjectPath().'"',
    1,
    fzf#vim#with_preview(),
    <bang>0
)
]]):gsub('\n', ' '))

print()
