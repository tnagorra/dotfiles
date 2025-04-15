require('nvim-treesitter.configs').setup({
    ensure_installed = {
        -- linux
        'bash',
        'diff',
        'gitattributes',
        'gitcommit',
        'git_config',
        'gitignore',
        'git_rebase',
        'gpg',
        'ssh_config',

        -- data
        'csv',
        'yaml',
        'markdown',
        'tsv',
        'json',

        -- frontend
        'css',
        'html',
        'javascript',
        'tsx',
        'typescript',

        -- devops
        'dockerfile',
        'helm',

        -- backend
        'lua',
        'python',
        'sql',

        -- misc
        'regex',
        'graphql',
    },
    highlight = {
        enable = true,
        -- disable = { "typescript", "javascript" },
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enabled = false,
    }
})
