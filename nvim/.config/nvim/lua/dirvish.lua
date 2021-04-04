local g = vim.g
local utils = require 'utils'
local map, autocmd = utils.map, utils.autocmd

g.dirvish_mode = 1
autocmd {
    dirvish = {
        { 'FileType', 'dirvish', 'silent sort "^.*[\\/]"' },
        { 'FileType', 'dirvish', 'silent! unmap <buffer> <C-p>' },
    };
}
map('n', '<leader>e', ':call dirvish#open(getcwd())<cr>')
map('n', '<leader>E', ':Dirvish %<cr>')
