vim.diagnostic.config({
    -- Show virtual text
    virtual_text = { current_line = true },
    -- Add border around diagnostics
    float = {
        border = 'single',
    },
})

-- Global mappings.
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float) -- # default is <C-W>d
vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist)
