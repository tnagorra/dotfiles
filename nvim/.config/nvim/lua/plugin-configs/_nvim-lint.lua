local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

require('lint').linters_by_ft = {
    python = {'flake8'},
    -- typescriptreact = {'eslint_d'},
    -- javascriptreact = {'eslint_d'},
    -- typescript = {'eslint_d'},
    -- javascript = {'eslint_d'},
}

autocmd({ 'BufWritePost' }, {
    group = augroup('UserLint', {}),
    callback = function()
        require('lint').try_lint()
    end,
})
