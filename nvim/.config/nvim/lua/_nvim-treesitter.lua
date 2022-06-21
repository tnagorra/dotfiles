require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "norg",
        -- "bash",
        -- "css",
        -- "dockerfile",
        -- "graphql",
        -- "javascript",
        -- "lua",
        -- "python",
        -- "regex",
        -- "tsx",
        -- "typescript",
        -- "json",
        -- "yaml",
    },
    highlight = {
        enable = true,
    }
}
-- indentation
-- folding
-- incremental search
