local map = vim.keymap.set

require('telescope').load_extension('live_grep_raw')
map('n', '<leader>f', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', { silent = true })
map('n', '<leader>F', ':lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>', { silent = true })
