call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/suda.vim'

" VISUAL

Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'kamykn/spelunker.vim'

" GIT

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" QUICKFIX

Plug 'AndrewRadev/qftools.vim'

" NAVIGATION

Plug 'justinmk/vim-dirvish'
Plug 'Shougo/denite.nvim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" LANGUAGE SUPPORT

Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

" OTHER

" Plug 'shime/vim-livedown'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

call plug#end()
