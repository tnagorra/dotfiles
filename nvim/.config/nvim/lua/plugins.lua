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

    -- misc
    use 'AndrewRadev/qftools.vim'
end)
