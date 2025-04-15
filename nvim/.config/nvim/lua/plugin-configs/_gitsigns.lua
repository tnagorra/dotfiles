require('gitsigns').setup({
    -- Add blame annotation at end of current line
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text_pos = "right_align"
    },
})
