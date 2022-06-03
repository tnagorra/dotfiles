local g = vim.g
local opt = vim.opt
local map = vim.keymap.set

local home = os.getenv('HOME') .. '/'

require 'plugins'

opt.laststatus = 3
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
opt.statusline = ' %<%f' .. '%w%h%m%r' .. '» %{&ff}/%Y ' .. '%=%l,%c%V %3p%% %L'
opt.rulerformat = '%30(%=:b%n%y%m%r%w %l,%c%V %P%)'
opt.fillchars = 'vert: ,fold: '

opt.directory = home .. '.local/share/nvim/swap,/tmp'
opt.undodir = home .. '.local/share/nvim/undo,/tmp'
opt.backupdir = home .. '.local/share/nvim/backup,/tmp'

g.mapleader = ','
g.maplocalleader = '\\'

-- set current file location as pwd
map('c', 'cd.', 'cd %:p:h')

-- sane jk navigation on wrapped lines
map('', 'j', 'v:count == 0 ? "gj" : "j"', { silent = true, expr = true })
map('', 'k', 'v:count == 0 ? "gk" : "k"', { silent = true, expr = true })

-- open/reload init.lua
-- NOTE: $HOME works here because it is parsed by vimscript
map('n', '<leader>c', ':e $HOME/.config/nvim/init.lua<CR>', { silent = true })
map('n', '<leader>r', ':luafile $HOME/.config/nvim/init.lua<CR>', { silent = true })

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.stylelint,
    },
})

require('gitsigns').setup()

-- require 'indent-blankline'
-- require 'neovide'
require 'fold'
require 'base16vim'
require 'netrw'
require 'suda'
require 'spelunker'
require 'ale'
require 'lsp'
require 'dirvish'
require 'fzf'
require 'firenvim'
require '_orgmode'
require '_gpg'
