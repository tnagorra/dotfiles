local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local highlight = vim.highlight
local fn = vim.fn
local v = vim.v
local api = vim.api

local function clear_highlight()
    api.nvim_command('highlight Folded guibg=NONE gui=italic')
end


autocmd('Colorscheme', {
    group = augroup('UserColorschemeFold', {}),
    pattern = '*',
    callback = function()
        clear_highlight()
    end,
})
autocmd('TextYankPost', {
    group = augroup('UserTextYank', {}),
    pattern = '*',
    callback = function()
        highlight.on_yank {on_visual = false, timeout=300}
    end,
})

function _G.clean_fold_text()
    local line = v.foldstart
    local line_text = fn.getline(line)
    local collapsed_lines = v.foldend - v.foldstart + 1
    return line_text .. ' ... ' .. collapsed_lines .. ' lines'
end

opt.foldtext = 'v:lua.clean_fold_text()'

clear_highlight()
