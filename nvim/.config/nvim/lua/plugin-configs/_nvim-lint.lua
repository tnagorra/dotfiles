local lint = require('lint')
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

lint.linters_by_ft = {
    python = {'flake8'},
}

autocmd('BufWritePost', {
    group = augroup('UserLintBufWritePost', {}),
    callback = function()
        lint.try_lint()
    end,
})

-- Should use TextChanged and InsertLeave but TextChanged doesn't work properly
