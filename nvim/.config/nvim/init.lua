local fn = vim.fn
local loop = vim.loop
local opt = vim.opt

local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not loop.fs_stat(lazypath) then
    fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
opt.rtp:prepend(lazypath)

require 'options'
require('lazy').setup('plugins')
require 'key-mappings'
require 'fold'
