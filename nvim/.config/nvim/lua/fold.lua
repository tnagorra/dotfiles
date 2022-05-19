local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

autocmd('Colorscheme', {
    pattern = '*',
    command = 'highlight Folded guibg=NONE gui=italic',
})
autocmd('Colorscheme', {
    pattern = '*',
    command = 'highlight Comment gui=italic',
})
autocmd('TextYankPost', {
    pattern = '*',
    callback = function() vim.highlight.on_yank {on_visual = false, timeout=300} end,
})

function _G.clean_fold_text()
    local line = vim.v.foldstart
    local line_text = vim.fn.getline(line)
    local collapsed_lines = vim.v.foldend - vim.v.foldstart + 1
    return line_text .. ' ... ' .. collapsed_lines .. ' lines'
end
opt.foldtext = 'v:lua.clean_fold_text()'
