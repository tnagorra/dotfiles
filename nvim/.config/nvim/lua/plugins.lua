local fn = vim.fn
local g = vim.g

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
        enabled = false,
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
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
          local presets = require("markview.presets").headings;
          require("markview").setup({
              initial_state = false,
              headings = {
                enable = true,
                heading_1 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '# ',
                },
                heading_2 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '## ',
                },
                heading_3 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '### ',
                },
                heading_4 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '#### ',
                },
                heading_5 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '##### ',
                },
                heading_6 = {
                  style = 'label',
                  align = 'left',
                  sign = '>',
                  icon = '###### ',
                }
              },
              list_items = {
                indent_size = 4,
                shift_width = 2,
              }
            });
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
        -- show indent lines
        'lukas-reineke/indent-blankline.nvim',
        enabled=false,
        config = function()
            require('plugin-configs/_indent-blankline')
        end,
    },
    {
        -- statusline
        'nvim-lualine/lualine.nvim',
        enabled=false,
        config = function()
            require('plugin-configs/_lualine')
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        -- spell check
        'kamykn/spelunker.vim',
        enabled=false,
        config = function()
            require('plugin-configs/_spelunker')
        end,
    },
    {
        'jamessan/vim-gnupg',
    },
    {
        'glacambre/firenvim',

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        lazy = not g.started_by_firenvim,
        build = function()
            fn["firenvim#install"](0)
        end,
        enabled=false,
        config = function()
            require('plugin-configs/_firenvim')
        end,
    },
}
