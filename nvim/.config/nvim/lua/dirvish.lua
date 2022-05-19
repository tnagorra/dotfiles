local g = vim.g
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

g.dirvish_mode = 1
autocmd('FileType', {
    pattern = 'dirvish',
    command = 'silent sort "^.*[\\/]"'
})
autocmd('FileType', {
    pattern = 'dirvish',
    command = 'silent! unmap <buffer> <C-p>'
})

map('n', '<leader>e', ':call dirvish#open(getcwd())<cr>')
map('n', '<leader>E', ':Dirvish %<cr>')
