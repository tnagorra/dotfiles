local utils = require 'utils'

local g = vim.g
local autocmd = utils.autocmd

g.enable_spelunker_vim = 1
g.spelunker_target_min_char_len = 3
g.spelunker_check_type = 1
g.spelunker_disable_auto_group = 1
autocmd {
    spelunker = {
        { 'BufWinEnter,BufWritePost', '*.ts,*.tsx,*.vim,*.js,*.jsx,*.json,*.md', 'call spelunker#check()' },
    };
}
