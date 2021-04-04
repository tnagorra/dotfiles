local g = vim.g

g.ale_completion_enabled = 1
g.ale_lint_delay = 200 -- ms
g.ale_lint_on_enter = 1
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = 1
g.ale_linters_explicit = 1
g.ale_sign_column_always = 1
g.ale_sign_error = '✱ '
g.ale_sign_warning = '✳ '
g.ale_javascript_eslint_use_global = 1
g.ale_javascript_eslint_executable = 'eslint_d'
g.ale_linters = {
    ['c'] = {'cppcheck', 'clangtidy'},
    ['lua'] = {'luac', 'luacheck'},
    ['cpp'] = {'cppcheck', 'clangtidy'},
    ['vim'] = {'vint'},
    ['python'] = {'flake8', 'pyright'},
    ['scss'] = {'stylelint'},
    ['css'] = {'stylelint'},
    ['javascript'] = {'eslint'},
    ['javascript.jsx'] = {'eslint'},
    ['javascriptreact'] = {'eslint'},
    ['typescript'] = {'eslint', 'tsserver'},
    ['typescript.tsx'] = {'eslint', 'tsserver'},
    ['typescriptreact'] = {'eslint', 'tsserver'},
}
g.ale_fixers = {
    ['c'] = {'clang-format'},
    ['cpp'] = {'clang-format'},
    ['vim'] = {'vint'},
    ['python'] = {'flake8', 'pyright'},
    ['scss'] = {'stylelint'},
    ['css'] = {'stylelint'},
    ['javascript'] = {'eslint'},
    ['javascript.jsx'] = {'eslint'},
    ['javascriptreact'] = {'eslint'},
    ['typescript'] = {'eslint'},
    ['typescript.tsx'] = {'eslint'},
    ['typescriptreact'] = {'eslint'},
}

