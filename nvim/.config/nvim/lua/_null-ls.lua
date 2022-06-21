local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,

        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.diagnostics.proselint,

        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.autopep8,

        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.formatting.lua_format,

        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,

        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylelint,
    },
})
