-- set current file location as pwd
vim.keymap.set('c', 'cd.', 'cd %:p:h')

-- sane jk navigation on wrapped lines
vim.keymap.set('', 'j', 'v:count == 0 ? "gj" : "j"', { silent = true, expr = true })
vim.keymap.set('', 'k', 'v:count == 0 ? "gk" : "k"', { silent = true, expr = true })

-- open/reload init.lua
-- NOTE: $HOME works here because it is parsed by vimscript
vim.keymap.set('n', '<leader>c', ':e $HOME/.config/nvim/lua/plugins.lua<CR>', { silent = true })

-- open current buffer on new tab (zen mode)
vim.keymap.set('n', '<leader>z', ':tab split<CR>')
