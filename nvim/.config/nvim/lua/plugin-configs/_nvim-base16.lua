vim.env.base16colorscheme = 256

local theme_config = '$HOME/.vimrc_background'
if vim.fn.filereadable(vim.fn.expand(theme_config)) ~= 0 then
    vim.cmd('source ' .. theme_config)
end
