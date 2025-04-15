-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable dirvish
vim.g.dirvish_mode = 1

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Dirvish: Sort files',
    group = vim.api.nvim_create_augroup('UserDirvishSort', {}),
    pattern = 'dirvish',
    command = 'silent sort "^.*[\\/]"'
})
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Dirvish: Unmap shortcuts',
    group = vim.api.nvim_create_augroup('UserDirvish', {}),
    pattern = 'dirvish',
    command = 'silent! unmap <buffer> <C-p>'
})

vim.keymap.set('n', '<leader>e', ':call dirvish#open(getcwd())<cr>')
vim.keymap.set('n', '<leader>E', ':Dirvish %<cr>')
