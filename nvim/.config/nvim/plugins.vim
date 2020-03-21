call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/suda.vim'

" VISUAL

Plug 'chriskempson/base16-vim'
" Plug 'Yggdroot/indentLine'
Plug 'kamykn/spelunker.vim'

" GIT

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" QUICKFIX

Plug 'AndrewRadev/qftools.vim'

" NAVIGATION

Plug 'justinmk/vim-dirvish'
Plug 'Shougo/denite.nvim'

" LANGUAGE SUPPORT

Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lsp'

call plug#end()
