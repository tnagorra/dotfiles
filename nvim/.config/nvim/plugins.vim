call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/suda.vim'

" VISUAL

Plug 'chriskempson/base16-vim'
Plug 'kamykn/spelunker.vim'

" GIT

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" QUICKFIX

Plug 'AndrewRadev/qftools.vim'

" NAVIGATION

Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf.vim'

" LANGUAGE SUPPORT

Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'machakann/vim-sandwich'

" Plug 'Yggdroot/indentLine'
" Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'miyakogi/seiya.vim'
" Plug 'mboughaba/i3config.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
