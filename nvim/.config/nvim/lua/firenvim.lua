local g = vim.g
local utils = require 'utils'

local opt, map, autocmd = utils.opt, utils.map, utils.autocmd

if g.started_by_firenvim then
    opt('o', 'laststatus', 0)
    opt('w', 'number', false)
    autocmd {
        firenvim = {
            { 'BufEnter', 'zube.io_*.txt', 'set filetype=markdown' },
            { 'BufEnter', 'github.com_*.txt', 'set filetype=markdown' },
        };
    }
    g.firenvim_config = {
        ['localSettings'] = {
            ['.*'] = {
                ['priority'] = 1,
                ['takeover'] = 'never',
                ['cmdlink'] = 'neovim',
            },
        }
    }
end
