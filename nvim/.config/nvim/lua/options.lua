local HOME = os.getenv('HOME') .. '/'

vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.opt.lazyredraw = true
vim.opt.hidden = true

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- vim.opt.foldmethod = 'indent'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.scroll = 10
vim.opt.scrolloff = 5
vim.opt.scrolljump = 5
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.showbreak = '⭑'
vim.opt.pumblend = 30
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.shortmess = 'filnxtToOrm'
vim.opt.list = true
vim.opt.listchars = 'tab:› ,trail:•,extends:…,nbsp:.'
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*/.git,*/coverage,*/__pycache__'
vim.opt.wildignorecase = true
vim.opt.statusline = ' %<%f' .. '%w%h%m%r' .. '» %{&ff}/%Y ' .. '%=%l,%c%V %3p%% %L'
vim.opt.rulerformat = '%30(%=:b%n%y%m%r%w %l,%c%V %P%)'
vim.opt.fillchars = 'vert: ,fold: '

vim.opt.directory = HOME .. '.local/share/nvim/swap,/tmp'
vim.opt.undodir = HOME .. '.local/share/nvim/undo,/tmp'
vim.opt.backupdir = HOME .. '.local/share/nvim/backup,/tmp'

vim.o.completeopt = 'menu,noinsert,popup,fuzzy'
-- FIXME: We cannot use this because it makes telescope UI unbearable
-- vim.o.winborder = 'rounded'

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- Use filetype.lua instead of filetype.vim
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
