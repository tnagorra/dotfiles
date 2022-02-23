local utils = require 'utils'
local opt, autocmd = utils.opt, utils.autocmd

function _G.clean_fold_text()
    local line = vim.v.foldstart
    local line_text = vim.fn.getline(line)
    local collapsed_lines = vim.v.foldend - vim.v.foldstart + 1
    return line_text .. ' ... ' .. collapsed_lines .. ' lines'
end

autocmd {
    fold_color = {
        { 'Colorscheme', '*', 'highlight Folded guibg=NONE gui=italic cterm=italic ctermbg=NONE' },
        { 'Colorscheme', '*', 'highlight Comment gui=italic cterm=italic' },
    };
    yank_color = {
        { 'TextYankPost', '*', 'lua vim.highlight.on_yank {on_visual = false, timeout=300}' },
    };
}

opt('w', 'foldtext', 'v:lua.clean_fold_text()')
