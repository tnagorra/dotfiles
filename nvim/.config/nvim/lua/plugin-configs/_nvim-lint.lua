local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

require('lint').linters_by_ft = {
    markdown = {'markdownlint'},
    python = {'flake8'},
}

autocmd({ 'BufWritePost' }, {
    group = augroup('UserLint', {}),
    callback = function()
        require('lint').try_lint()
    end,
})
