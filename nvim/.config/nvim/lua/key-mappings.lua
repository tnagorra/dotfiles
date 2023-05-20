local map = vim.keymap.set

-- set current file location as pwd
map('c', 'cd.', 'cd %:p:h')

-- sane jk navigation on wrapped lines
map('', 'j', 'v:count == 0 ? "gj" : "j"', { silent = true, expr = true })
map('', 'k', 'v:count == 0 ? "gk" : "k"', { silent = true, expr = true })

-- open/reload init.lua
-- NOTE: $HOME works here because it is parsed by vimscript
map('n', '<leader>c', ':e $HOME/.config/nvim/lua/plugins.lua<CR>', { silent = true })

-- open current buffer on new tab
map('n', '<leader>t', ':tab split<CR>')
