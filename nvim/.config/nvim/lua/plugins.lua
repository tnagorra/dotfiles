return {
    {
        -- Manage external deps
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function()
            require('plugin-configs/_mason')
        end,
    },
    {
        -- Manage external deps for lsp
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('plugin-configs/_mason-lspconfig')
        end,
    },
    {
        -- file manager
        'justinmk/vim-dirvish',
        config = function()
            require('plugin-configs/_vim-dirvish')
        end,
    },
    {
        -- sudo support
        'lambdalisue/suda.vim',
        config = function()
            require('plugin-configs/_suda')
        end,
    },
    {
        -- fuzzy search
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-raw.nvim',
        },
        config = function()
            require('plugin-configs/_telescope')
        end,
    },
    {
        -- git signs
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugin-configs/_gitsigns')
        end,
    },
    {
        -- git conflicts
        'akinsho/git-conflict.nvim',
        config = function()
            require('plugin-configs/_git-conflict')
        end,
    },
    {
        -- multiple language support
        'sheerun/vim-polyglot',
        init = function()
            require('plugin-configs/_polyglot')
        end,
    },
    {
        -- lsp support
        'neovim/nvim-lspconfig',
        config = function()
            require('plugin-configs/_lspconfig')
        end,
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    {
        -- treesitter support
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugin-configs/_nvim-treesitter')
        end,
    },
    {
        -- support reading jupyter notebook
        'goerz/jupytext.nvim',
        version = '0.2.0',
        opts = {},
    },
    {
        -- misc
        'AndrewRadev/qftools.vim'
    },
    {
        -- indent lines
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('plugin-configs/_hlchunk')
        end
    },
    {
        -- folds
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
        },
        config = function()
            require('plugin-configs/_nvim-ufo')
        end,
    },
    {
        -- colorscheme
        'RRethy/nvim-base16',
        config = function()
            require('plugin-configs/_nvim-base16')
        end,
    },
    {
        -- gnupg support
        'jamessan/vim-gnupg',
    },
}
