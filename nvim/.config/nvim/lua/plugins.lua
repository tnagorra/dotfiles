local fn = vim.fn

return {
    {
        -- Manage external dependencies
        'williamboman/mason.nvim',
        build = ':MasonUpdate', -- :MasonUpdate updates registry contents
        config = function()
            require('plugin-configs/_mason')
        end,
    },
    {
        -- Manage external dependencies for lsp
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('plugin-configs/_mason-lspconfig')
        end,
        dependencies = {
            'williamboman/mason.nvim',
        }
    },
    {
        'mfussenegger/nvim-lint',
        config = function()
            require('plugin-configs/_nvim-lint')
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
        -- warp directory
        'tnagorra/wd-nvim'
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
        -- git
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugin-configs/_gitsigns')
        end,
    },
    {
        -- spell check
        'kamykn/spelunker.vim',
        config = function()
            require('plugin-configs/_spelunker')
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
        'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('peek').setup()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
    },
    {
        -- misc
        'AndrewRadev/qftools.vim'
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
        enabled=false,
        config = function()
            require('plugin-configs/_lualine')
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        -- show indent lines
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugin-configs/_indent-blankline')
        end,
    },
}
