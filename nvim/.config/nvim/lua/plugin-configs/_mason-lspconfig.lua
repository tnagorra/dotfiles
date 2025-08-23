require('mason-lspconfig').setup({
    automatic_enable = true,
    ensure_installed={
        'ruff',
        'pyright',
        'ts_ls',
        'cssmodules_ls',
        'bashls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'gh_actions_ls',
        'graphql',
        'helm_ls',
        'html',
        'jsonls',
        'lua_ls',
        'sqlls',
        'stylelint_lsp',
        -- 'volar',
        'yamlls',
        'harper_ls',
    }
})
