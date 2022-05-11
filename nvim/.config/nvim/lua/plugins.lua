return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gui
    use 'chriskempson/base16-vim'
    use 'sheerun/vim-polyglot'
    -- use {'lukas-reineke/indent-blankline.nvim', branch='lua'}

    -- git
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'

    -- file-system
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'justinmk/vim-dirvish'
    use 'lambdalisue/suda.vim'
    use 'tnagorra/wd-nvim'
    -- use '~/Projects/personal/wd-nvim'

    -- spell check
    use 'kamykn/spelunker.vim'

    -- language
    use 'w0rp/ale'
    use 'npxbr/glow.nvim'
    use 'neovim/nvim-lspconfig'

    -- misc
    use { 'jamessan/vim-gnupg' }
    use {'nvim-treesitter/nvim-treesitter'}
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end}

    use 'AndrewRadev/qftools.vim'
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
end)
