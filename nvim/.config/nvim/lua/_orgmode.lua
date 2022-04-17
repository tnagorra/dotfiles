-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
    org_agenda_files = {'~/Notes/org/*'},
    org_default_notes_file = '~/Notes/org/refile.org',
    org_todo_keywords = {'TODO(t)', 'IN_PROGRESS(i)', '|', 'DONE(d)'},
    org_hide_leading_stars = true,
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
