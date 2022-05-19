require('orgmode').setup_ts_grammar()
local autocmd = vim.api.nvim_create_autocmd

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'},
}

require('orgmode').setup({
    org_agenda_files = {'~/Notes/org/*'},
    org_default_notes_file = '~/Notes/org/refile.org',
    org_todo_keywords = { 'TODO', 'NEXT', '|', 'DONE', 'DELEGATED' },
    org_indent_mode = false,
    -- org_hide_leading_stars = true,
    org_hide_empasis_markers = true,
    org_ellipsis = '…',
    org_agenda_templates = {
        t = {
            description = 'Todo',
            template = '* TODO %?\n %u',
            target = '~/Notes/org/todo.org'
        },
        m = {
            description = 'Meeting',
            template = '* Meeting %?\n %u',
            target = '~/Notes/org/todo.org'
        },
    },
})


autocmd('FileType', {
        pattern = 'org',
        command = 'setlocal foldlevel=99'
})
autocmd('FileType', {
        pattern = 'org',
        command = 'setlocal conceallevel=2'
})
autocmd('FileType', {
        pattern = 'org',
        command = 'setlocal concealcursor=nc'
})
