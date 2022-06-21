local g = vim.g
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

if g.started_by_firenvim then
    opt.laststatus = 0
    opt.number = false

    autocmd('BufEnter', {
        pattern = 'zube.io_*.txt',
        command = 'set filetype=markdown',
    })
    autocmd('BufEnter', {
        pattern = 'github.com_*.txt',
        command = 'set filetype=markdown',
    })

    g.firenvim_config = {
        ['localSettings'] = {
            ['.*'] = {
                ['priority'] = 1,
                ['takeover'] = 'never',
                ['cmdlink'] = 'neovim',
            },
        }
    }
end
