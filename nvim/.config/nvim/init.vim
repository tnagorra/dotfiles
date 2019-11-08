source ~/.config/nvim/plugins.vim
source ~/.config/nvim/custom_fold.vim

filetype plugin indent on
syntax on

" GENERAL

set encoding=UTF-8
set updatetime=1000
set lazyredraw                                      " Don't draw while executing macros
set hidden                                          " Don't unload a buffer when no longer show in window
set foldlevel=99
set foldmethod=indent                               " Set type of fold (syntax, indent)
set nospell                                         " Enable spell correction
set scroll=11                                       " Number of lines to scroll for Ctrl-U and Ctrl-D
set scrolloff=5                                     " Minimal number of screen lines to keep above/below the cursor.
set scrolljump=5                                    " Lines to scroll when cursor leaves screen
set mouse=a                                         " Enable mouse for all modes
set ignorecase                                      " Uses case insensitive search
set smartcase
set splitbelow                                      " A new window is put below the current one
set splitright                                      " A new window is put right of the current one
set directory=~/.config/nvim/tmp/swap,/tmp                  " Directory for vim swap
set undofile                                        " Automatically save and restore undo history
set undodir=~/.config/nvim/tmp/undo,/tmp                    " Directory for vim undo
set backup                                          " Enable backup
set backupdir=~/.config/nvim/tmp/backup,/tmp                " Set backup dir
set viminfo+=n~/.config/nvim/tmp/viminfo                    " Put viminfo inside .vim/tmp folder

" FORMATTING

set tabstop=4                                       " Number of spaces a <Tab> in text stands for
set shiftwidth=4                                    " Number of spaces used for each step of indent
set softtabstop=4                                   " number of spaces to insert for a <Tab>
set expandtab                                       " Set <Tab> to spaces in Insert mode
set smartindent                                     " Do clever auto indentation
set whichwrap=b,s,h,l,<,>,[,]                       " Backspace and cursor keys wrap too
set nowrap                                          " Don't wrap long lines
set breakindent                                     " Preserve indent on wrap
set showbreak=…                                     " Wrap indicator

" UI

set termguicolors
if filereadable(expand('~/.vimrc_background'))
    let base16colorspace=256
    set background=light
    source ~/.vimrc_background
endif

if has('statusline')
    set statusline=\ %<%f                               " Filename
    set statusline+=%w%h%m%r\                           " Options
    set statusline+=»\ %{&ff}/%Y\                       " Filetype
    set statusline+=%=%l,%c%V\ %3p%%\ %L                " Right aligned file navigation info
endif

if has('cmdline_info')
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " A ruler on steroids
endif

set pumblend=20
set showmatch                                       " When inserting bracket, briefly jump to its match
set number                                          " Show line number for each line
set fillchars+=vert:\                               " Remove ugly | in split
set shortmess=filmnrxoOtT                           " Show short message to avoid hit-enter
set viewoptions=folds,options,cursor,unix,slash     " Better Unix / Windows compatibility
set iskeyword-=.                                    " '.' is an end of word designator
set list                                            " Useful to see difference between tab and space
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.      " Highlight problematic whitespace
set wildmode=list:longest                           " Specifies how command line completion works
set wildignore=*.o,*.obj,*/.git/*,*/node_modules,*/coverage/,*/bower_components,*/dist,__pycache__,env " List of file patterns ignored while expanding wildcards
set wildignorecase                                  " Ignore case when completing file names
set foldtext=MyFoldText()

" MAPPINGS

" Map leader to ,
let mapleader = ','
let maplocalleader = '\\'

" For when you forget to sudo
" cnoremap w!! w !sudo tee % >/dev/null

" Change working directory to that of the current file
cnoremap cd. cd %:p:h

" smart navigation even on wrapped lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>c :e $MYVIMRC<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>

source ~/.config/nvim/plugins_config.vim
