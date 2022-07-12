local map = vim.keymap.set

require('telescope').load_extension('live_grep_args')
map('n', '<leader>f', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', { silent = true })
map('n', '<leader>F', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', { silent = true })
