" PLUGIN netrw

let g:loaded_netrw = 1              " disable
let g:loaded_netrwPlugin = 1

" lambdalisue/suda.vim

let g:suda_smart_edit = 1

" PLUGIN Yggdroot/indentLine

let g:indentLine_char = '▏'

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

" PLUGIN w0rp/ale

let g:ale_completion_enabled = 1
let g:ale_lint_delay = 200 " ms
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '> '
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
    \ 'c': ['cppcheck', 'clangtidy'],
    \ 'cpp': ['cppcheck', 'clangtidy'],
    \ 'vim': ['vint'],
    \ 'typescript': ['tsserver', 'tslint', 'eslint'],
    \ 'typescript.tsx': ['tsserver', 'tslint', 'eslint'],
    \ 'javascript': ['eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'python': ['flake8'],
    \ 'scss': ['stylelint'],
    \ 'css': ['stylelint']
    \ }
let g:ale_fixers = {
    \ 'c': ['clang-format'],
    \ 'cpp': ['clang-format'],
    \ 'vim': ['vint'],
    \ 'scss': ['stylelint'],
    \ 'css': ['stylelint'],
    \ 'typescript': ['tsserver', 'tslint', 'eslint'],
    \ 'typescript.tsx': ['tsserver', 'tslint', 'eslint'],
    \ 'javascript.jsx': ['eslint'],
    \ 'javascript': ['eslint'],
    \ }

" PLUGIN Denite

call denite#custom#var('file/rec', 'command', ['rg', '--smart-case', '--follow', '--no-ignore', '--hidden', '--files', '--glob', '!{.git,node_modules,coverage,.cache,android,ios,__pycache__,build}'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--smart-case', '--follow', '--no-ignore', '--hidden', '--vimgrep', '--heading', '--glob', '!{.git,node_modules,coverage,.cache,android,ios,__pycache__,build}'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('buffer', 'date_format', '')

call denite#custom#option('_', {
    \ 'split': 'floating',
    \ 'auto_resize': 1,
    \ 'start_filter': 1,
    \ 'prompt': 'λ ',
    \ 'cur_pos': 0,
    \ 'reversed': 1,
    \ 'statusline': 0,
    \ 'highlight_matched_char': 'Underlined',
    \ })

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')

    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action', 'open')

    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-o> denite#do_map('open_filter_buffer')

    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')

    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> <C-Space> denite#do_map('toggle_select_all')

    nnoremap <silent><buffer><expr> <C-q> denite#do_map('do_action', 'quickfix')
endfunction

map <leader>f :DeniteProjectDir file/rec<CR>
map <leader>b :DeniteProjectDir buffer<CR>
map <leader>F :DeniteProjectDir grep<CR>

" PLUG coc

" nmap <silent> <leader>td <Plug>(coc-type-definition)
" nmap <silent> <leader>df <Plug>(coc-definition)
" nmap <silent> <leader>dc <Plug>(coc-declaration)
" nmap <silent> <leader>re <Plug>(coc-references)
" nmap <silent> <leader>im <Plug>(coc-implementation)
" nmap <silent> <leader>mv <Plug>(coc-rename)

" should markdown preview get shown automatically upon opening markdown buffer
" let g:livedown_autorun = 1
" let g:livedown_open = 1
" let g:livedown_port = 8099
" let g:livedown_browser = "firefox-developer-edition"

let g:notes_directories = ['~/Documents/Note']
