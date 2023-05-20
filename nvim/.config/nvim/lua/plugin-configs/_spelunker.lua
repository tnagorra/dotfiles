-- local utils = require 'utils'

local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

g.enable_spelunker_vim = 1
g.spelunker_target_min_char_len = 3
g.spelunker_check_type = 1
g.spelunker_disable_auto_group = 1

g.spelunker_spell_bad_group = 'SpellRare'
g.spelunker_complex_or_compound_word_group = 'SpellRare'

autocmd('BufWinEnter', {
    group = augroup('UserSpelunkerEnter', {}),
    pattern = '*.ts,*.tsx,*.vim,*.js,*.jsx,*.json,*.md',
    command = 'call spelunker#check()'
})
autocmd('BufWritePost', {
    group = augroup('UserSpelunkerWrite', {}),
    pattern = '*.ts,*.tsx,*.vim,*.js,*.jsx,*.json,*.md',
    command = 'call spelunker#check()'
})
