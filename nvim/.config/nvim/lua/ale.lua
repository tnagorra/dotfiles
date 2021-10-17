local g = vim.g

-- g.ale_completion_enabled = 1

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

g.ale_python_auto_pipenv = 1
g.ale_python_auto_poetry = 1
g.ale_python_pylint_change_directory = 0
g.ale_python_flake8_change_directory = 0

g.ale_linters = {
    ['c'] = {'cppcheck', 'clangtidy'},
    ['lua'] = {'luac', 'luacheck'},
    ['cpp'] = {'cppcheck', 'clangtidy'},
    ['vim'] = {'vint'},
    ['python'] = {'flake8'},
    ['scss'] = {'stylelint'},
    ['css'] = {'stylelint'},
    ['javascript'] = {'eslint'},
    ['javascript.jsx'] = {'eslint'},
    ['javascriptreact'] = {'eslint'},
    ['typescript'] = {'eslint'},
    ['typescript.tsx'] = {'eslint'},
    ['typescriptreact'] = {'eslint'},
}
g.ale_fixers = {
    ['c'] = {'clang-format'},
    ['cpp'] = {'clang-format'},
    ['vim'] = {'vint'},
    ['python'] = {'flake8'},
    ['scss'] = {'stylelint'},
    ['css'] = {'stylelint'},
    ['javascript'] = {'eslint'},
    ['javascript.jsx'] = {'eslint'},
    ['javascriptreact'] = {'eslint'},
    ['typescript'] = {'eslint'},
    ['typescript.tsx'] = {'eslint'},
    ['typescriptreact'] = {'eslint'},
}
