local cmd, g = vim.cmd, vim.g

if vim.fn.exists('g:neovide') ~= 0 then
    cmd[[set guifont=Anonymous\ Pro\ 12]]

    g.neovide_cursor_animation_length=0.05
    g.neovide_cursor_trail_length=0.2
    g.neovide_cursor_vfx_mode = 'sonicboom'
end
