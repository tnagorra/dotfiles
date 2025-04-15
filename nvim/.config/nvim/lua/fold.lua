local function clear_highlight()
    vim.api.nvim_command('highlight Folded guibg=NONE gui=italic')
end

vim.api.nvim_create_autocmd('Colorscheme', {
    desc = 'Fold: Update fold highlight',
    group = vim.api.nvim_create_augroup('UserColorschemeFold', {}),
    pattern = '*',
    callback = function()
        clear_highlight()
    end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Fold: Update yank highlight',
    group = vim.api.nvim_create_augroup('UserTextYank', {}),
    pattern = '*',
    callback = function()
        vim.hl.on_yank {on_visual = false, timeout=300}
    end,
})

clear_highlight()
