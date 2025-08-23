return {
    {
        -- external deps management
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function()
            require('plugin-configs/_mason')
        end,
    },
    {
        -- external deps for lsp
        'williamboman/mason-lspconfig.nvim',
        after = { "mason.nvim", "nvim-lspconfig" },
        config = function()
            require('plugin-configs/_mason-lspconfig')
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
        -- file manager
        'justinmk/vim-dirvish',
        config = function()
            require('plugin-configs/_vim-dirvish')
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
        -- completion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            require('plugin-configs/_nvim-cmp')
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
        -- languages support
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
    },
    {
        -- treesitter support
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugin-configs/_nvim-treesitter')
        end,
    },
    {
        -- editable quickfix list
        'itchyny/vim-qfedit',
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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('plugin-configs/_lualine')
        end,
    },
    {
        -- gnupg edit support
        'jamessan/vim-gnupg',
    },
    {
        -- jupyter notebook edit support
        'goerz/jupytext.nvim',
        version = '0.2.0',
        opts = {},
    },
}
