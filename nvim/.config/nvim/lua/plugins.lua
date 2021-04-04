local cmd = vim.cmd
cmd 'packadd packer.nvim'

local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lambdalisue/suda.vim'
    use 'chriskempson/base16-vim'
    use 'kamykn/spelunker.vim'
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use 'AndrewRadev/qftools.vim'
    use 'justinmk/vim-dirvish'
    use 'sheerun/vim-polyglot'
    use 'w0rp/ale'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
end)

