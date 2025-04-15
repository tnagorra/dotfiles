require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<leader>f', function()
    require("telescope.builtin")
        .find_files({ hidden = true })
end, { silent = true })

vim.keymap.set('n', '<leader>F', function()
    require("telescope").extensions.live_grep_args
        .live_grep_args({ default_text= "--hidden " })
end, { silent = true })
