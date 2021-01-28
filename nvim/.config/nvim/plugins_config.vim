" PLUGIN netrw

let g:loaded_netrw = 1              " disable
let g:loaded_netrwPlugin = 1

" lambdalisue/suda.vim

let g:suda_smart_edit = 1

" PLUGIN kamykn/spelunker.vim
let g:enable_spelunker_vim = 1
let g:spelunker_target_min_char_len = 3
let g:spelunker_disable_auto_group = 1
augroup spelunker
    autocmd!
    autocmd BufWinEnter,BufWritePost *.ts,*.tsx,*.vim,*.js,*.jsx,*.json,*.md call spelunker#check()
augroup END

" PLUGIN justinmk/vim-dirvish

let g:dirvish_mode = 1
augroup dirvish
    autocmd!
    autocmd FileType dirvish silent sort '^.*[\/]'
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

" Open file manager in current working directory
nnoremap <leader>e :call dirvish#open(getcwd()) <cr>

" Open file manager in current file's directory
nnoremap <leader>E :Dirvish % <cr>

" PLUGIN treesitter
" :lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
"   refactor = {
"     highlight_definitions = { enable = true },
"   },
" }
" EOF

" PLUGIN nvim-lsp
" :lua << END
"   require'nvim_lsp'.bashls.setup{}
"   require'nvim_lsp'.dockerls.setup{}
"   require'nvim_lsp'.tsserver.setup{}
"   require'nvim_lsp'.vimls.setup{}
"   require'nvim_lsp'.cssls.setup{}
" END

" function! SetOptions() " {{{
"     setlocal omnifunc=v:lua.vim.lsp.omnifunc
"     nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"     nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"     nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"     nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"     nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"     nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"     nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"     nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"     nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" endfunction " }}}

" augroup nvimlsp
"     autocmd!
"     autocmd FileType typescriptreact call SetOptions()
"     autocmd FileType typescript call SetOptions()
"     autocmd FileType typescript.tsx call SetOptions()
"     autocmd FileType javascriptreact call SetOptions()
"     autocmd FileType javascript call SetOptions()
"     autocmd FileType javascript.tsx call SetOptions()
"
"     autocmd FileType vim call SetOptions()
"     autocmd FileType sh call SetOptions()
"     autocmd FileType dockerfile call SetOptions()
"
"     autocmd FileType css call SetOptions()
" augroup END

" Fzf related bindings
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Rg 

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'), 'r', { 'title': 'My search' })
    copen
    cc
endfunction

" FZF
let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'


let g:ale_completion_enabled = 1
let g:ale_lint_delay = 200 " ms
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '> '
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
    \ 'c': ['cppcheck', 'clangtidy'],
    \ 'cpp': ['cppcheck', 'clangtidy'],
    \ 'vim': ['vint'],
    \ 'python': ['flake8', 'pyright'],
    \ 'scss': ['stylelint'],
    \ 'css': ['stylelint'],
    \ 'javascript': ['eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'javascriptreact': ['eslint'],
    \ 'typescript': ['eslint', 'tsserver'],
    \ 'typescript.tsx': ['eslint', 'tsserver'],
    \ 'typescriptreact': ['eslint', 'tsserver'],
    \ }
let g:ale_fixers = {
    \ 'c': ['clang-format'],
    \ 'cpp': ['clang-format'],
    \ 'vim': ['vint'],
    \ 'python': ['flake8', 'pyright'],
    \ 'scss': ['stylelint'],
    \ 'css': ['stylelint'],
    \ 'javascript': ['eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'javascriptreact': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'typescript.tsx': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \ }
