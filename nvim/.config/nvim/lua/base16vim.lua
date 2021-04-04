local cmd, env, fn = vim.cmd, vim.env, vim.fn

env.base16colorscheme = 256

local theme_config = '$HOME/.vimrc_background'
if fn.filereadable(fn.expand(theme_config)) then
    cmd('source ' .. theme_config)
end
