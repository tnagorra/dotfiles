local peek = require('peek')
local command = vim.api.nvim_create_user_command

peek.setup({
    theme = 'light',
});

command('PeekOpen', peek.open, {})
command('PeekClose', peek.close, {})
