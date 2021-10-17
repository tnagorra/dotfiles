local g = vim.g

local utils = require 'utils'
local opt, map, autocmd = utils.opt, utils.map, utils.autocmd

local home = os.getenv('HOME') .. '/'

require 'plugins'

opt('o', 'termguicolors', true)
opt('o', 'background', 'light')
opt('o', 'lazyredraw', true)
opt('o', 'hidden', true)
opt('w', 'foldlevel', 99)
opt('w', 'foldmethod', 'indent')
opt('w', 'scroll', 10)
opt('w', 'scrolloff', 5)
opt('o', 'scrolljump', 5)
opt('o', 'mouse', 'a')
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('b', 'undofile', true)
opt('o', 'backup', true)
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('b', 'softtabstop', 4)
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('w', 'wrap', false)
opt('w', 'breakindent', true)
opt('o', 'showbreak', '…')
opt('o', 'pumblend', 20)
opt('o', 'showmatch', true)
opt('w', 'number', true)
opt('o', 'shortmess', 'filnxtToOrm')
opt('w', 'list', true)
opt('w', 'listchars', 'tab:› ,trail:•,extends:⭑,nbsp:.')
opt('o', 'wildmode', 'list:longest')
opt('o', 'wildignore', '*/.git,*/node_modules,*/coverage,*/__pycache__')
opt('o', 'wildignorecase', true)
opt('w', 'statusline', ' %<%f' .. '%w%h%m%r' .. '» %{&ff}/%Y ' .. '%=%l,%c%V %3p%% %L')
opt('o', 'rulerformat', '%30(%=:b%n%y%m%r%w %l,%c%V %P%)')
opt('w', 'fillchars', 'vert: ,fold: ')

opt('o', 'directory', home .. '.local/share/nvim/swap,/tmp')
opt('o', 'undodir', home .. '.local/share/nvim/undo,/tmp')
opt('o', 'backupdir', home .. '.local/share/nvim/backup,/tmp')

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

require 'fold'
-- require 'indent-blankline'
require 'base16vim'
require 'netrw'
require 'suda'
require 'spelunker'
require 'ale'
require 'lsp'
require 'dirvish'
require 'fzf'
require 'neovide'

if g.started_by_firenvim then
    opt('o', 'laststatus', 0)
    opt('w', 'number', false)
    autocmd {
        firenvim = {
            { 'BufEnter', 'zube.io_*.txt', 'set filetype=markdown' },
            { 'BufEnter', 'github.com_*.txt', 'set filetype=markdown' },
        };
    }
    g.firenvim_config = {
        ['localSettings'] = {
            ['.*'] = {
                ['priority'] = 1,
                ['takeover'] = 'never',
            },
            ['https://zube.io/'] = {
                ['priority'] = 1,
                ['takeover'] = 'always',
            },
            ['https://github.com/'] = {
                ['priority'] = 1,
                ['takeover'] = 'always',
            },
        }
    }
end
