local g = vim.g
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

g.dirvish_mode = 1
autocmd('FileType', {
    group = augroup('UserDirvishSort', {}),
    pattern = 'dirvish',
    command = 'silent sort "^.*[\\/]"'
})
autocmd('FileType', {
    group = augroup('UserDirvish', {}),
    pattern = 'dirvish',
    command = 'silent! unmap <buffer> <C-p>'
})

map('n', '<leader>e', ':call dirvish#open(getcwd())<cr>')
map('n', '<leader>E', ':Dirvish %<cr>')
