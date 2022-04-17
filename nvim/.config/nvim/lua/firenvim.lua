local g = vim.g
local opt = vim.opt
local utils = require 'utils'

local autocmd = utils.autocmd

if g.started_by_firenvim then
    opt.laststatus = 0
    opt.number = false
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
