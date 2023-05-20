local g = vim.g
local opt = vim.opt

local home = os.getenv('HOME') .. '/'

opt.termguicolors = true
opt.background = 'light'
opt.lazyredraw = true
opt.hidden = true
opt.foldlevel = 99
opt.foldmethod = 'indent'
opt.scroll = 10
opt.scrolloff = 5
opt.scrolljump = 5
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.backup = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.breakindent = true
opt.showbreak = '⭑'
opt.pumblend = 20
opt.showmatch = true
opt.number = true
opt.shortmess = 'filnxtToOrm'
opt.list = true
opt.listchars = 'tab:› ,trail:•,extends:…,nbsp:.'
opt.wildmode = 'list:longest'
opt.wildignore = '*/.git,*/node_modules,*/coverage,*/__pycache__'
opt.wildignorecase = true
-- opt.laststatus = 3
opt.statusline = ' %<%f' .. '%w%h%m%r' .. '» %{&ff}/%Y ' .. '%=%l,%c%V %3p%% %L'
opt.rulerformat = '%30(%=:b%n%y%m%r%w %l,%c%V %P%)'
opt.fillchars = 'vert: ,fold: '

opt.directory = home .. '.local/share/nvim/swap,/tmp'
opt.undodir = home .. '.local/share/nvim/undo,/tmp'
opt.backupdir = home .. '.local/share/nvim/backup,/tmp'

-- opt.spelloptions = 'camel'
-- opt.spellcapcheck = ''
-- opt.spell = true

g.mapleader = ','
g.maplocalleader = '\\'

-- Use filetype.lua instead of filetype.vim
g.do_filetype_lua = 1
g.did_load_filetypes = 0
