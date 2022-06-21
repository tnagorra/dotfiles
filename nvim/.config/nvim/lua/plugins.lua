-- TODO:
-- dap
-- status line
-- startup
-- indent
-- file explorer
-- git
-- comment
-- motion
-- project/session
-- test
-- autopair
-- formatter
-- rest.nvim
-- zenmode

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'RRethy/nvim-base16'

    -- git
    use 'lewis6991/gitsigns.nvim'

    -- file-system
    use 'justinmk/vim-dirvish'
    use 'lambdalisue/suda.vim'
    use 'tnagorra/wd-nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-raw.nvim',
        }
    }

    -- spell check
    use 'kamykn/spelunker.vim'

    -- language
    use 'sheerun/vim-polyglot'
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }
    use {
        'nvim-neorg/neorg',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }

    -- misc
    use 'jamessan/vim-gnupg'
    use 'AndrewRadev/qftools.vim'

    -- use 'diepm/vim-rest-console'
    -- use 'beauwilliams/focus.nvim'
    -- use 'stevearc/dressing.nvim'
    -- use 'jamestthompson3/nvim-remote-containers'
    -- use 'windwp/nvim-ts-autotag'
    -- use 'AckslD/nvim-revJ.lua'
    -- use 'bennypowers/nvim-regexplainer'
    -- use {
    --     'glacambre/firenvim',
    --     run = function() vim.fn['firenvim#install'](0) end
    -- }
end)
